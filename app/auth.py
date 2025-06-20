from datetime import date, datetime

from flask import Blueprint, request, jsonify
from flask_login import login_user, logout_user, current_user, login_required, UserMixin
from werkzeug.security import generate_password_hash, check_password_hash
from repositories import UserRepository, LogActionRepository, LogAuthRepository
from app import login_manager, db

user_repo = UserRepository(db)
log_auth_repo = LogAuthRepository(db)
bp = Blueprint('auth', __name__, url_prefix='/auth')


class User(UserMixin):
    def __init__(self, user_dict):
        self.id = user_dict['id']
        self.username = user_dict['username']
        self.email = user_dict['email']
        self.role_name = user_dict.get('role_name', 'user')
        self.current_points = user_dict.get('сurrent_points', 0)

    def get_id(self):
        return str(self.id)

@bp.route('/register', methods=['POST'])
def register():
    data = request.json
    hashed_password = generate_password_hash(data['password'], method='pbkdf2:sha256')

    try:
        user_id = user_repo.create(
            username=data['username'],
            email=data['email'],
            password=hashed_password,
            avatar=data.get('avatar'),
            roles_id=data.get('roles_id', 2)
        )
        return jsonify({"message": "User created", "id": user_id}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 400


@login_manager.user_loader
def load_user(user_id):
    user = user_repo.get_by_id(user_id)
    if user:
        return User(user)
    return None


@bp.route('/login', methods=['POST'])
def login():
    data = request.json
    user_data = user_repo.get_by_email(data['email'])

    if not user_data or not check_password_hash(user_data['password'], data['password']):
        return jsonify({"error": "Invalid credentials"}), 401

    user = User(user_data)
    login_user(user)

    log_auth_repo.create(datetime.utcnow(), 0, user.id)

    return jsonify({
        "message": "Logged in successfully",
        "user": {
            "id": user.id,
            "username": user.username,
            "email": user.email,
            "role": user.role_name
        }
    })


@bp.route('/logout', methods=['POST'])
@login_required
def logout():
    logout_user()
    return jsonify({"message": "Logged out"})


@bp.route('/is_auth', methods=['GET'])
def is_auth():
    if current_user.is_authenticated:
        return jsonify({
            "is_authenticated": True,
            "user": {
                "id": current_user.id,
                "username": current_user.username,
                "email": current_user.email,
                "role": current_user.role_name,
                "current_points": current_user.current_points
            }
        })
    return jsonify({"is_authenticated": False})


@bp.route('/profile', methods=['GET'])
@login_required
def profile():
    return jsonify({
        "id": current_user.id,
        "username": current_user.username,
        "email": current_user.email,
        "role": current_user.role_name,
        "current_points": current_user.current_points
    })