#!/usr/bin/env python3
"""
End-to-End Encrypted (E2EE) Messenger Engine (Crypto 10-Weeks Capstone Baseline)
Integrates Curve25519 (ECDH) + HKDF + AES-256-GCM + Ed25519 Signatures.
"""

from cryptography.hazmat.primitives.asymmetric import x25519, ed25519
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.kdf.hkdf import HKDF
from cryptography.hazmat.primitives.ciphers.aead import AESGCM
import os

class E2EESecureEndpoint:
    def __init__(self, name: str):
        self.name = name
        # Identity Key Pair for Signing (Ed25519)
        self.id_priv = ed25519.Ed25519PrivateKey.generate()
        self.id_pub = self.id_priv.public_key()
        
        # Ephemeral Key Pair for Key Exchange (X25519)
        self.eph_priv = x25519.X25519PrivateKey.generate()
        self.eph_pub = self.eph_priv.public_key()
        self.session_key = None

    def establish_session(self, peer_eph_pub):
        """Computes ECDH shared key and derives 256-bit AES-GCM session key."""
        shared_secret = self.eph_priv.exchange(peer_eph_pub)
        hkdf = HKDF(
            algorithm=hashes.SHA256(),
            length=32,
            salt=b"E2EE-Protocol-Salt-2026",
            info=b"E2EE Session Key Derivation",
        )
        self.session_key = hkdf.derive(shared_secret)

    def encrypt_payload(self, plaintext: str) -> dict:
        """Encrypts payload with AES-256-GCM and signs ciphertext using Ed25519."""
        if not self.session_key:
            raise ValueError("Session not established!")
            
        aesgcm = AESGCM(self.session_key)
        nonce = os.urandom(12)
        ciphertext = aesgcm.encrypt(nonce, plaintext.encode('utf-8'), None)
        signature = self.id_priv.sign(ciphertext)
        
        return {
            "nonce": nonce,
            "ciphertext": ciphertext,
            "signature": signature
        }

    def decrypt_payload(self, packet: dict, peer_id_pub) -> str:
        """Verifies Ed25519 signature and decrypts AES-256-GCM payload."""
        if not self.session_key:
            raise ValueError("Session not established!")
            
        # Verify signature first
        peer_id_pub.verify(packet["signature"], packet["ciphertext"])
        
        # Decrypt payload
        aesgcm = AESGCM(self.session_key)
        plaintext_bytes = aesgcm.decrypt(packet["nonce"], packet["ciphertext"], None)
        return plaintext_bytes.decode('utf-8')

if __name__ == "__main__":
    print("=== CRYPTO CAPSTONE: END-TO-END ENCRYPTED (E2EE) MESSENGER ENGINE ===")
    
    alice = E2EESecureEndpoint("Alice")
    bob = E2EESecureEndpoint("Bob")
    
    # Establish Session
    alice.establish_session(bob.eph_pub)
    bob.establish_session(alice.eph_pub)
    print("[+] ECDH + HKDF Session Key exchange completed successfully!")
    
    msg = "TOP-SECRET CRYPTOGRAPHIC PAYLOAD: KEY = 0x99AABBCC"
    print(f"\n[Alice] Sending Plaintext: {msg}")
    
    packet = alice.encrypt_payload(msg)
    print(f"[Network] Encrypted Packet Ciphertext (Hex): {packet['ciphertext'].hex()[:32]}...")
    
    decrypted_msg = bob.decrypt_payload(packet, alice.id_pub)
    print(f"[Bob] Decrypted E2EE Message: {decrypted_msg}")
