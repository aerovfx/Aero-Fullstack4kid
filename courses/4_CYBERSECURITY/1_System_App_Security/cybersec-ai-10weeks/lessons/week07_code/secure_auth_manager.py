import bcrypt
import time

user_db = {}
failed_attempts = {}

def register_user(username, password):
    salt = bcrypt.gensalt(rounds=12)
    hashed = bcrypt.hashpw(password.encode('utf-8'), salt)
    user_db[username] = hashed
    failed_attempts[username] = 0
    print(f"[+] Account '{username}' registered successfully with Bcrypt salt.")

def login_user(username, password):
    if username not in user_db:
        print("[-] Login failed: User does not exist.")
        return False
        
    if failed_attempts[username] >= 3:
        print("[🛑 ACCOUNT LOCKED] Too many failed attempts! Contact admin.")
        return False
        
    # Simulate a 1-second delay to deter automated brute-force attacks
    time.sleep(1)
    
    if bcrypt.checkpw(password.encode('utf-8'), user_db[username]):
        print(f"[✅ SUCCESS] Welcome back, {username}!")
        failed_attempts[username] = 0
        return True
    else:
        failed_attempts[username] += 1
        print(f"[-] Login failed: Invalid password ({failed_attempts[username]}/3 attempts).")
        return False

if __name__ == "__main__":
    print("=== SECURE AUTHENTICATION MANAGER DEMO ===")
    register_user("alice", "Password123!")
    
    # Try valid login
    login_user("alice", "Password123!")
    
    # Try invalid logins to trigger lock
    login_user("alice", "WrongPassword")
    login_user("alice", "WrongPassword")
    login_user("alice", "WrongPassword")
    login_user("alice", "Password123!") # Attempting after lock
