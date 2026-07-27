# Raspberry Pi 4 Autonomous Vehicle Lane Keeping Master Code
# Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks

import cv2
import numpy as np

def process_frame(frame):
    h, w = frame.shape[:2]
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    blurred = cv2.GaussianBlur(gray, (5, 5), 0)
    edges = cv2.Canny(blurred, 50, 150)

    # ROI Crop lower 40%
    mask = np.zeros_like(edges)
    cv2.rectangle(mask, (0, int(h * 0.6)), (w, h), 255, -1)
    roi = cv2.bitwise_and(edges, mask)

    # Hough Lines
    lines = cv2.HoughLinesP(roi, 1, np.pi/180, 20, minLineLength=20, maxLineGap=50)
    
    camera_center = w // 2
    lane_center = camera_center

    if lines is not None:
        x_pts = [l[0][0] for l in lines] + [l[0][2] for l in lines]
        if x_pts:
            lane_center = int(np.mean(x_pts))

    error = lane_center - camera_center
    steer_angle = max(45, min(135, 90 + 0.18 * error))
    return steer_angle, roi

def main():
    cap = cv2.VideoCapture(0)
    cap.set(3, 640); cap.set(4, 480)
    print("[+] Autonomous Car Lane Keeper Active!")

    while cap.isOpened():
        ret, frame = cap.read()
        if not ret: break

        steer, roi = process_frame(frame)
        cv2.putText(frame, f"Steer Angle: {steer:.1f} deg", (20, 40),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 255, 0), 2)
        cv2.imshow("AV Lane Engine", frame)

        if cv2.waitKey(1) & 0xFF == ord('q'): break

    cap.release()
    cv2.destroyAllWindows()

if __name__ == "__main__":
    main()
