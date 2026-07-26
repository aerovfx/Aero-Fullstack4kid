import React from 'react';
import { BookOpen, Terminal, Sparkles, Cpu, ChevronRight, CheckCircle2 } from 'lucide-react';

export default function CourseRoadmap({ syllabus, activeModule, setActiveModule, activeLesson, setActiveLesson, completedLessons, setActiveTab }) {
  
  // Icon mapper for modules
  const getModuleIcon = (id) => {
    switch (id) {
      case 'module-1':
        return <Terminal size={24} color="var(--color-cyan)" />;
      case 'module-2':
        return <Cpu size={24} color="var(--color-green)" />;
      case 'module-3':
        return <Sparkles size={24} color="var(--color-purple)" />;
      case 'module-4':
        return <BookOpen size={24} color="var(--color-orange)" />;
      default:
        return <Terminal size={24} />;
    }
  };

  const getGlowColorClass = (id) => {
    switch (id) {
      case 'module-1': return 'cyber-panel-cyan';
      case 'module-2': return 'cyber-panel-green';
      case 'module-3': return 'cyber-panel-purple';
      case 'module-4': return 'cyber-panel-cyan';
      default: return 'cyber-panel-cyan';
    }
  };

  const getAccentColor = (id) => {
    switch (id) {
      case 'module-1': return 'var(--color-cyan)';
      case 'module-2': return 'var(--color-green)';
      case 'module-3': return 'var(--color-purple)';
      case 'module-4': return 'var(--color-orange)';
      default: return 'var(--color-cyan)';
    }
  };

  const handleStartLearning = (module, lesson) => {
    setActiveModule(module);
    setActiveLesson(lesson);
    setActiveTab('lessons');
  };

  return (
    <div style={{ padding: '24px 0', maxWidth: '1200px', margin: '0 auto' }}>
      
      {/* Intro Banner */}
      <div className="cyber-panel" style={{
        marginBottom: '40px',
        padding: '36px',
        background: 'linear-gradient(135deg, rgba(22, 27, 34, 0.9) 0%, rgba(7, 8, 11, 0.9) 100%)',
        borderLeft: '4px solid var(--color-cyan)',
        boxShadow: 'inset 0 0 30px rgba(0, 240, 255, 0.05)'
      }}>
        <h2 style={{
          fontSize: '2rem',
          marginBottom: '12px',
          textTransform: 'uppercase',
          fontWeight: 900,
          background: 'linear-gradient(to right, #ffffff, var(--color-cyan))',
          WebkitBackgroundClip: 'text',
          WebkitTextFillColor: 'transparent',
          fontFamily: 'var(--font-cyber)'
        }}>
          LỘ TRÌNH ĐÀO TẠO CYBERSECURITY TÍCH HỢP AI
        </h2>
        <p style={{ color: 'var(--text-muted)', fontSize: '1.05rem', maxWidth: '800px', marginBottom: '24px' }}>
          Chào mừng bạn đến với chương trình huấn luyện an ninh mạng thế hệ mới. Lộ trình được thiết kế nhằm giúp học viên đi từ nền tảng lập trình hệ thống, sử dụng công cụ Kali Linux thực tế cho tới ứng dụng và phát triển các giải pháp bảo mật tự động hóa với Trí tuệ Nhân tạo.
        </p>
        <div style={{ display: 'flex', gap: '24px', flexWrap: 'wrap' }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
            <span className="glow-dot glow-dot-cyan pulse"></span>
            <span style={{ fontSize: '0.9rem', color: 'var(--text-main)', fontFamily: 'var(--font-cyber)' }}>4 MODULE CHUYÊN SÂU</span>
          </div>
          <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
            <span className="glow-dot glow-dot-green pulse"></span>
            <span style={{ fontSize: '0.9rem', color: 'var(--text-main)', fontFamily: 'var(--font-cyber)' }}>12 BÀI HỌC VÀ 4 PHÒNG THỰC HÀNH LAB</span>
          </div>
          <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
            <span className="glow-dot glow-dot-purple pulse"></span>
            <span style={{ fontSize: '0.9rem', color: 'var(--text-main)', fontFamily: 'var(--font-cyber)' }}>GIẢ LẬP TRỢ LÝ AI HỖ TRỢ NGHIÊN CỨU</span>
          </div>
        </div>
      </div>

      {/* Roadmap Cards Grid */}
      <div style={{
        display: 'grid',
        gridTemplateColumns: 'repeat(auto-fit, minmax(280px, 1fr))',
        gap: '24px',
        position: 'relative'
      }}>
        {syllabus.map((module, index) => {
          const completedCount = module.lessons.filter(l => completedLessons.includes(l.id)).length;
          const totalLessons = module.lessons.length;
          const progressPercent = (completedCount / totalLessons) * 100;
          const accentColor = getAccentColor(module.id);
          
          return (
            <div 
              key={module.id} 
              className={`cyber-panel ${getGlowColorClass(module.id)}`}
              style={{
                display: 'flex',
                flexDirection: 'column',
                justifyContent: 'space-between',
                minHeight: '340px',
                borderTop: `1px solid ${accentColor}`,
                background: 'rgba(22, 27, 34, 0.45)',
              }}
            >
              <div>
                {/* Header Icon & Number */}
                <div style={{
                  display: 'flex',
                  justifyContent: 'space-between',
                  alignItems: 'center',
                  marginBottom: '16px'
                }}>
                  <div style={{
                    background: 'rgba(0, 0, 0, 0.3)',
                    padding: '10px',
                    borderRadius: '8px',
                    border: '1px solid rgba(255, 255, 255, 0.05)',
                    display: 'inline-flex'
                  }}>
                    {getModuleIcon(module.id)}
                  </div>
                  <span style={{
                    fontFamily: 'var(--font-cyber)',
                    fontSize: '0.8rem',
                    color: 'var(--text-muted)',
                    letterSpacing: '0.1em'
                  }}>
                    PHASE 0{index + 1}
                  </span>
                </div>

                {/* Title & Desc */}
                <h3 style={{
                  fontSize: '1.15rem',
                  marginBottom: '10px',
                  lineHeight: '1.4',
                  fontFamily: 'var(--font-cyber)',
                }}>
                  {module.title.replace(/Module \\d+: /, '')}
                </h3>
                <p style={{
                  color: 'var(--text-muted)',
                  fontSize: '0.85rem',
                  marginBottom: '20px',
                  display: '-webkit-box',
                  WebkitLineClamp: 3,
                  WebkitBoxOrient: 'vertical',
                  overflow: 'hidden',
                  height: '56px'
                }}>
                  {module.shortDesc}
                </p>
              </div>

              {/* Progress & Start Button */}
              <div>
                {/* Lesson & Lab count */}
                <div style={{
                  display: 'flex',
                  justifyContent: 'space-between',
                  fontSize: '0.75rem',
                  color: 'var(--text-muted)',
                  marginBottom: '8px',
                  fontFamily: 'var(--font-cyber)'
                }}>
                  <span>{totalLessons} Bài học • {module.labs.length} Lab</span>
                  <span style={{ color: accentColor }}>
                    {completedCount}/{totalLessons} Đã học
                  </span>
                </div>

                {/* Progress bar */}
                <div style={{
                  height: '4px',
                  background: 'rgba(255, 255, 255, 0.05)',
                  borderRadius: '2px',
                  marginBottom: '20px',
                  overflow: 'hidden'
                }}>
                  <div style={{
                    width: `${progressPercent}%`,
                    height: '100%',
                    background: accentColor,
                    borderRadius: '2px',
                    transition: 'width 0.4s ease',
                    boxShadow: `0 0 8px ${accentColor}`
                  }} />
                </div>

                {/* Action button */}
                <button
                  onClick={() => handleStartLearning(module, module.lessons[0])}
                  className="cyber-btn"
                  style={{
                    width: '100%',
                    justifyContent: 'center',
                    borderColor: accentColor,
                    color: accentColor,
                    textShadow: `0 0 4px ${accentColor}`
                  }}
                >
                  <span>BẮT ĐẦU HỌC</span>
                  <ChevronRight size={14} />
                </button>
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}
