import fs from 'fs';
import { fileURLToPath } from 'url';
import path from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Import existing syllabus
import { coursesData } from './platform/src/data/syllabus.js';

// Define the 6 domains mapping
const domainMap = {
    "1_AI_DATA_SCIENCE": {
        title: "AI & Data Science",
        shortDesc: "Phân tích dữ liệu, Học máy và Trí tuệ Nhân tạo",
        modules: ["4_DATA_SCIENCE", "5_ARTIFICIAL_INTELLIGENCE"]
    },
    "2_SOFTWARE_ENGINEERING": {
        title: "Software Engineering",
        shortDesc: "Thiết kế, xây dựng và triển khai các ứng dụng phần mềm đa nền tảng.",
        modules: ["0_CS_FUNDAMENTALS", "1_FRONT_END", "2_BACK_END", "3_SOFTWARE_DEV", "6_WEB3", "9_CLOUD_DEVOPS", "10_MOBILE_DEV"]
    },
    "3_INFRA_NETWORKING": {
        title: "Infrastructure & Networking",
        shortDesc: "Vận hành mạng máy tính và cơ sở hạ tầng viễn thông.",
        modules: ["8_NETWORKING"]
    },
    "4_CYBERSECURITY": {
        title: "Cybersecurity",
        shortDesc: "Bảo mật hệ thống, mật mã học và Ethical Hacking.",
        modules: ["7_SECURITY"]
    },
    "5_GRAPHICS_HCI": {
        title: "Computer Graphics & HCI",
        shortDesc: "Đồ hoạ, Game 2D/3D và thiết kế tương tác thực tế ảo.",
        modules: ["11_GAME_DEV"]
    },
    "6_HARDWARE_EMBEDDED": {
        title: "Hardware & Embedded Systems",
        shortDesc: "Lập trình vi điều khiển, phần cứng và Internet vạn vật (IoT).",
        modules: [] // Will insert the new IoT course here
    }
};

const newCoursesData = {};

for (const [newDomainId, domainInfo] of Object.entries(domainMap)) {
    newCoursesData[newDomainId] = {
        id: newDomainId,
        title: domainInfo.title,
        shortDesc: domainInfo.shortDesc,
        syllabus: []
    };
    
    // Combine syllabuses
    for (const oldModuleId of domainInfo.modules) {
        if (coursesData[oldModuleId]) {
            // Re-prefix module IDs inside syllabus so they don't clash, though they probably don't
            const oldSyllabus = coursesData[oldModuleId].syllabus;
            // Add a prefix to the title to indicate the sub-course
            for (const mod of oldSyllabus) {
                // mod is actually a Course in the new paradigm
                // We'll just append them sequentially
                mod.title = `[${coursesData[oldModuleId].title}] ${mod.title}`;
                newCoursesData[newDomainId].syllabus.push(mod);
            }
        }
    }
}

// Add the IoT Course manually to 6_HARDWARE_EMBEDDED
newCoursesData["6_HARDWARE_EMBEDDED"].syllabus.push({
    id: "iot-m1",
    title: "[Phần Cứng & IoT] Module 1: Từ Arduino đến Smart Home",
    shortDesc: "Làm quen linh kiện điện tử, vi điều khiển C++ và kết nối vạn vật.",
    lessons: [
        {
            id: "iot-w1",
            title: "Bài 1: Nhập môn Điện tử & Arduino",
            duration: "2.5 giờ",
            objectives: [
                "Làm quen Breadboard, LED, Điện trở.",
                "Cấu trúc chương trình C++ trên Arduino IDE.",
                "Chớp tắt LED."
            ],
            content: "### 1. Arduino UNO\nBo mạch vi điều khiển phổ biến nhất thế giới.\n### 2. Cấu trúc C++\nGồm setup() chạy 1 lần và loop() chạy vô hạn."
        },
        {
            id: "iot-w2",
            title: "Bài 2: Tín hiệu Số & Nút nhấn",
            duration: "2.0 giờ",
            objectives: [
                "Đọc tín hiệu Digital.",
                "Xử lý chống rung phím (Debounce)."
            ],
            content: "Sử dụng lệnh digitalRead() để đọc trạng thái nút nhấn và digitalWrite() để điều khiển thiết bị khác dựa trên trạng thái đó."
        }
    ],
    labs: [
        {
            id: "iot-lab1",
            title: "Lab 1: Hệ thống đèn cầu thang thông minh",
            description: "Thiết kế mạch có 2 công tắc ở 2 đầu cầu thang điều khiển chung 1 bóng đèn.",
            steps: [
                "Bước 1: Lắp mạch 2 nút nhấn và 1 LED.",
                "Bước 2: Lập trình C++ thay đổi trạng thái đèn mỗi khi 1 trong 2 nút được nhấn."
            ]
        }
    ]
});


let finalOutput = `// Export syllabus data for all courses in the academy
export const coursesData = ${JSON.stringify(newCoursesData, null, 2)};
`;

fs.writeFileSync('./platform/src/data/syllabus.js', finalOutput);
console.log('Syllabus rewritten successfully!');
