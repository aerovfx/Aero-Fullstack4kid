import React, { useState } from 'react';
import { Play, CheckCircle2, Circle, Clock, Target, ChevronRight, Award, AlertTriangle, ShieldCheck } from 'lucide-react';
import confetti from 'canvas-confetti';

export default function LessonContent({ 
  syllabus, 
  activeModule, 
  setActiveModule, 
  activeLesson, 
  setActiveLesson, 
  completedLessons, 
  toggleLessonComplete 
}) {
  const [selectedTab, setSelectedTab] = useState('lesson'); // 'lesson' or 'lab'
  const [labSubmitted, setLabSubmitted] = useState({});

  const activeModuleData = syllabus.find(m => m.id === activeModule) || syllabus[0];

  const handleCompleteLesson = (lessonId) => {
    toggleLessonComplete(lessonId);
    
    // Trigger success confetti
    confetti({
      particleCount: 80,
      spread: 60,
      origin: { y: 0.8 },
      colors: ['#00f0ff', '#00ff66', '#9d4edd']
    });
  };

  const handleLabSubmit = (labId) => {
    setLabSubmitted(prev => ({ ...prev, [labId]: true }));
    confetti({
      particleCount: 150,
      spread: 80,
      origin: { y: 0.7 },
      colors: ['#00ff66', '#00f0ff']
    });
  };

  // Custom markdown renderer for clean, glowing text
  const renderMarkdown = (text) => {
    if (!text) return null;
    const parts = text.split(/(```[\s\S]*?```)/g);
    return parts.map((part, idx) => {
      if (part.startsWith('```')) {
        const match = part.match(/```(\w+)?\n([\s\S]*?)```/);
        const lang = match ? match[1] : '';
        const code = match ? match[2] : part.slice(3, -3);
        return (
          <pre key={idx} style={{
            background: 'rgba(0, 0, 0, 0.4)',
            padding: '16px',
            borderRadius: '8px',
            border: '1px solid rgba(255, 255, 255, 0.05)',
            overflowX: 'auto',
            margin: '16px 0',
            fontFamily: 'var(--font-code)',
            fontSize: '0.85rem',
            color: '#e6edf3',
            position: 'relative'
          }}>
            <div style={{
              position: 'absolute',
              top: '6px',
              right: '12px',
              fontSize: '0.65rem',
              color: 'var(--text-muted)',
              textTransform: 'uppercase',
              letterSpacing: '0.1em',
              fontFamily: 'var(--font-cyber)'
            }}>
              {lang || 'code'}
            </div>
            <code>{code.trim()}</code>
          </pre>
        );
      } else {
        const lines = part.split('\n');
        return lines.map((line, lIdx) => {
          if (line.startsWith('### ')) {
            return (
              <h3 key={`${idx}-${lIdx}`} style={{
                color: 'var(--color-cyan)',
                marginTop: '24px',
                marginBottom: '12px',
                borderBottom: '1px solid rgba(0, 240, 255, 0.1)',
                paddingBottom: '6px',
                fontFamily: 'var(--font-cyber)',
                fontWeight: 600
              }}>
                {line.slice(4)}
              </h3>
            );
          } else if (line.startsWith('- ') || line.trim().startsWith('* ')) {
            const content = line.startsWith('- ') ? line.slice(2) : line.trim().slice(2);
            return (
              <li key={`${idx}-${lIdx}`} style={{
                marginLeft: '20px',
                marginBottom: '8px',
                color: 'var(--text-main)',
                listStyleType: 'square'
              }}>
                {renderInlineCode(content)}
              </li>
            );
          } else if (line.trim() === '') {
            return null;
          } else {
            return (
              <p key={`${idx}-${lIdx}`} style={{
                marginBottom: '14px',
                color: 'var(--text-main)',
                fontSize: '0.95rem',
                lineHeight: '1.7'
              }}>
                {renderInlineCode(line)}
              </p>
            );
          }
        });
      }
    });
  };

  const renderInlineCode = (text) => {
    const parts = text.split(/(`[^`]+`)/g);
    return parts.map((part, idx) => {
      if (part.startsWith('`') && part.endsWith('`')) {
        return (
          <code key={idx} style={{
            background: 'rgba(0, 0, 0, 0.3)',
            color: 'var(--color-orange)',
            padding: '2px 6px',
            borderRadius: '4px',
            fontFamily: 'var(--font-code)',
            fontSize: '0.9em',
            border: '1px solid rgba(255, 255, 255, 0.03)'
          }}>
            {part.slice(1, -1)}
          </code>
        );
      }
      return part;
    });
  };

  return (
    <div style={{
      display: 'grid',
      gridTemplateColumns: '300px 1fr',
      gap: '24px',
      maxWidth: '1200px',
      margin: '0 auto',
      padding: '24px 0',
      minHeight: 'calc(100vh - 120px)'
    }}>
      
      {/* Sidebar Navigation */}
      <div className="cyber-panel" style={{
        padding: '16px',
        alignSelf: 'start',
        maxHeight: 'calc(100vh - 150px)',
        overflowY: 'auto'
      }}>
        {/* Module Selector */}
        <div style={{ marginBottom: '20px' }}>
          <label style={{
            fontSize: '0.65rem',
            color: 'var(--text-muted)',
            textTransform: 'uppercase',
            letterSpacing: '0.15em',
            fontFamily: 'var(--font-cyber)',
            display: 'block',
            marginBottom: '8px'
          }}>
            CHỌN CHƯƠNG TRÌNH
          </label>
          <select 
            value={activeModule}
            onChange={(e) => {
              const modId = e.target.value;
              setActiveModule(modId);
              const nextMod = syllabus.find(m => m.id === modId);
              setActiveLesson(nextMod.lessons[0]);
              setSelectedTab('lesson');
            }}
            style={{
              width: '100%',
              background: 'var(--bg-dark)',
              color: 'var(--text-main)',
              border: '1px solid rgba(255, 255, 255, 0.08)',
              padding: '10px',
              borderRadius: '6px',
              outline: 'none',
              fontFamily: 'var(--font-cyber)',
              fontSize: '0.8rem',
              cursor: 'pointer'
            }}
          >
            {syllabus.map(m => (
              <option key={m.id} value={m.id}>
                {m.title.split(':')[0]}
              </option>
            ))}
          </select>
        </div>

        {/* Lessons List */}
        <div>
          <div style={{
            fontSize: '0.65rem',
            color: 'var(--text-muted)',
            textTransform: 'uppercase',
            letterSpacing: '0.15em',
            fontFamily: 'var(--font-cyber)',
            marginBottom: '10px',
            borderBottom: '1px solid rgba(255, 255, 255, 0.03)',
            paddingBottom: '4px'
          }}>
            BÀI HỌC LÝ THUYẾT
          </div>
          
          <div style={{ display: 'flex', flexDirection: 'column', gap: '6px' }}>
            {activeModuleData.lessons.map((lesson) => {
              const isSelected = selectedTab === 'lesson' && activeLesson?.id === lesson.id;
              const isCompleted = completedLessons.includes(lesson.id);
              
              return (
                <button
                  key={lesson.id}
                  onClick={() => {
                    setActiveLesson(lesson);
                    setSelectedTab('lesson');
                  }}
                  style={{
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'space-between',
                    width: '100%',
                    padding: '10px 12px',
                    borderRadius: '6px',
                    border: '1px solid transparent',
                    background: isSelected ? 'rgba(0, 240, 255, 0.06)' : 'transparent',
                    color: isSelected ? 'var(--color-cyan)' : 'var(--text-main)',
                    cursor: 'pointer',
                    transition: 'var(--transition)',
                    textAlign: 'left',
                    borderColor: isSelected ? 'rgba(0, 240, 255, 0.2)' : 'transparent'
                  }}
                >
                  <div style={{ display: 'flex', alignItems: 'center', gap: '8px', overflow: 'hidden' }}>
                    {isCompleted ? (
                      <CheckCircle2 size={14} color="var(--color-green)" style={{ flexShrink: 0 }} />
                    ) : (
                      <Circle size={14} color="var(--text-muted)" style={{ flexShrink: 0 }} />
                    )}
                    <span style={{ 
                      fontSize: '0.8rem', 
                      overflow: 'hidden', 
                      textOverflow: 'ellipsis', 
                      whiteSpace: 'nowrap',
                      fontWeight: isSelected ? 600 : 400
                    }}>
                      {lesson.title.split(': ')[1] || lesson.title}
                    </span>
                  </div>
                  <ChevronRight size={12} style={{ opacity: isSelected ? 1 : 0.3 }} />
                </button>
              );
            })}
          </div>
        </div>

        {/* Labs List */}
        <div style={{ marginTop: '24px' }}>
          <div style={{
            fontSize: '0.65rem',
            color: 'var(--text-muted)',
            textTransform: 'uppercase',
            letterSpacing: '0.15em',
            fontFamily: 'var(--font-cyber)',
            marginBottom: '10px',
            borderBottom: '1px solid rgba(255, 255, 255, 0.03)',
            paddingBottom: '4px'
          }}>
            PHÒNG LAB THỰC HÀNH
          </div>
          
          <div style={{ display: 'flex', flexDirection: 'column', gap: '6px' }}>
            {activeModuleData.labs.map((lab) => {
              const isSelected = selectedTab === 'lab';
              const isCompleted = labSubmitted[lab.id];
              
              return (
                <button
                  key={lab.id}
                  onClick={() => {
                    setSelectedTab('lab');
                  }}
                  style={{
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'space-between',
                    width: '100%',
                    padding: '10px 12px',
                    borderRadius: '6px',
                    border: '1px solid transparent',
                    background: isSelected ? 'rgba(0, 255, 102, 0.05)' : 'transparent',
                    color: isSelected ? 'var(--color-green)' : 'var(--text-main)',
                    cursor: 'pointer',
                    transition: 'var(--transition)',
                    textAlign: 'left',
                    borderColor: isSelected ? 'rgba(0, 255, 102, 0.2)' : 'transparent'
                  }}
                >
                  <div style={{ display: 'flex', alignItems: 'center', gap: '8px', overflow: 'hidden' }}>
                    {isCompleted ? (
                      <Award size={14} color="var(--color-green)" style={{ flexShrink: 0 }} />
                    ) : (
                      <Play size={14} color="var(--color-green)" style={{ flexShrink: 0 }} />
                    )}
                    <span style={{ 
                      fontSize: '0.8rem', 
                      overflow: 'hidden', 
                      textOverflow: 'ellipsis', 
                      whiteSpace: 'nowrap',
                      fontWeight: isSelected ? 600 : 400
                    }}>
                      {lab.title.split(': ')[1] || lab.title}
                    </span>
                  </div>
                  <ChevronRight size={12} style={{ opacity: isSelected ? 1 : 0.3 }} />
                </button>
              );
            })}
          </div>
        </div>
      </div>

      {/* Main Content Area */}
      <div className="cyber-panel" style={{
        padding: '30px',
        overflowY: 'auto',
        maxHeight: 'calc(100vh - 150px)'
      }}>
        {selectedTab === 'lesson' && activeLesson ? (
          <div>
            {/* Header info */}
            <div style={{
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'space-between',
              marginBottom: '20px',
              borderBottom: '1px solid rgba(255, 255, 255, 0.05)',
              paddingBottom: '16px'
            }}>
              <div>
                <span style={{
                  fontSize: '0.7rem',
                  fontFamily: 'var(--font-cyber)',
                  color: 'var(--color-cyan)',
                  textTransform: 'uppercase',
                  letterSpacing: '0.1em'
                }}>
                  {activeModuleData.title}
                </span>
                <h2 style={{ fontSize: '1.5rem', marginTop: '4px', fontFamily: 'var(--font-cyber)' }}>
                  {activeLesson.title}
                </h2>
              </div>
              
              <div style={{
                display: 'flex',
                alignItems: 'center',
                gap: '8px',
                background: 'rgba(0, 0, 0, 0.2)',
                padding: '6px 12px',
                borderRadius: '6px',
                fontSize: '0.8rem',
                color: 'var(--text-muted)'
              }}>
                <Clock size={14} />
                <span style={{ fontFamily: 'var(--font-cyber)' }}>{activeLesson.duration}</span>
              </div>
            </div>

            {/* Learning Objectives */}
            <div style={{
              background: 'rgba(0, 240, 255, 0.02)',
              border: '1px solid rgba(0, 240, 255, 0.1)',
              borderRadius: '8px',
              padding: '16px',
              marginBottom: '24px'
            }}>
              <div style={{
                display: 'flex',
                alignItems: 'center',
                gap: '8px',
                marginBottom: '10px',
                color: 'var(--color-cyan)',
                fontFamily: 'var(--font-cyber)',
                fontSize: '0.85rem',
                fontWeight: 600
              }}>
                <Target size={16} />
                <span>MỤC TIÊU BÀI HỌC</span>
              </div>
              <ul style={{ margin: 0, paddingLeft: '20px' }}>
                {activeLesson.objectives.map((obj, i) => (
                  <li key={i} style={{ fontSize: '0.85rem', color: 'var(--text-main)', marginBottom: '4px' }}>
                    {obj}
                  </li>
                ))}
              </ul>
            </div>

            {/* Lesson Body */}
            <div className="lesson-content">
              {renderMarkdown(activeLesson.content)}
            </div>

            {/* Complete Button */}
            <div style={{
              marginTop: '36px',
              borderTop: '1px solid rgba(255, 255, 255, 0.05)',
              paddingTop: '20px',
              display: 'flex',
              justifyContent: 'flex-end'
            }}>
              <button
                onClick={() => handleCompleteLesson(activeLesson.id)}
                className="cyber-btn cyber-btn-success"
                style={{
                  display: 'flex',
                  alignItems: 'center',
                  gap: '8px'
                }}
              >
                <CheckCircle2 size={16} />
                <span>{completedLessons.includes(activeLesson.id) ? "ĐÃ HOÀN THÀNH (BẤM LẠI)" : "ĐÁNH DẤU HOÀN THÀNH BÀI"}</span>
              </button>
            </div>
          </div>
        ) : (
          /* Lab Content */
          activeModuleData.labs.map((lab) => (
            <div key={lab.id}>
              {/* Header Info */}
              <div style={{
                borderBottom: '1px solid rgba(255, 255, 255, 0.05)',
                paddingBottom: '16px',
                marginBottom: '20px'
              }}>
                <span style={{
                  fontSize: '0.7rem',
                  fontFamily: 'var(--font-cyber)',
                  color: 'var(--color-green)',
                  textTransform: 'uppercase',
                  letterSpacing: '0.1em'
                }}>
                  {activeModuleData.title} • PHÒNG THỰC HÀNH
                </span>
                <h2 style={{ fontSize: '1.5rem', marginTop: '4px', fontFamily: 'var(--font-cyber)' }}>
                  {lab.title}
                </h2>
              </div>

              {/* Ethics Warning Banner */}
              <div style={{
                background: 'rgba(255, 51, 102, 0.05)',
                border: '1px solid rgba(255, 51, 102, 0.2)',
                borderRadius: '8px',
                padding: '16px',
                marginBottom: '24px',
                display: 'flex',
                gap: '12px',
                alignItems: 'flex-start'
              }}>
                <AlertTriangle size={20} color="var(--color-red)" style={{ flexShrink: 0 }} />
                <div>
                  <h4 style={{ color: 'var(--color-red)', fontSize: '0.85rem', marginBottom: '4px' }}>CẢNH BÁO AN TOÀN & ĐẠO ĐỨC</h4>
                  <p style={{ fontSize: '0.8rem', color: 'var(--text-muted)', margin: 0 }}>
                    Mọi hành động kiểm thử mạng và xâm nhập chỉ được thực hiện trên các hệ thống mục tiêu do chính bạn sở hữu hoặc đã nhận được sự đồng ý rõ ràng bằng văn bản từ chủ quản hệ thống. Việc tấn công trái phép các hệ thống mạng khác là vi phạm pháp luật nghiêm trọng.
                  </p>
                </div>
              </div>

              {/* Lab Description */}
              <p style={{ color: 'var(--text-main)', fontSize: '0.95rem', marginBottom: '24px', lineHeight: '1.6' }}>
                {lab.description}
              </p>

              {/* Lab Steps */}
              <div style={{ marginBottom: '30px' }}>
                <h3 style={{
                  fontSize: '1rem',
                  color: 'var(--color-green)',
                  fontFamily: 'var(--font-cyber)',
                  marginBottom: '16px',
                  display: 'flex',
                  alignItems: 'center',
                  gap: '8px'
                }}>
                  <ShieldCheck size={18} />
                  <span>CÁC BƯỚC THỰC HIỆN LAB</span>
                </h3>
                
                <div style={{ display: 'flex', flexDirection: 'column', gap: '16px' }}>
                  {lab.steps.map((step, index) => (
                    <div key={index} style={{
                      background: 'rgba(0, 0, 0, 0.2)',
                      border: '1px solid rgba(255, 255, 255, 0.03)',
                      borderRadius: '8px',
                      padding: '16px',
                      display: 'flex',
                      gap: '14px',
                      alignItems: 'flex-start'
                    }}>
                      <div style={{
                        background: 'rgba(0, 255, 102, 0.1)',
                        color: 'var(--color-green)',
                        width: '28px',
                        height: '28px',
                        borderRadius: '50%',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        fontWeight: 'bold',
                        fontSize: '0.85rem',
                        fontFamily: 'var(--font-cyber)',
                        flexShrink: 0
                      }}>
                        {index + 1}
                      </div>
                      <p style={{ margin: 0, fontSize: '0.9rem', color: 'var(--text-main)', paddingTop: '3px' }}>
                        {step}
                      </p>
                    </div>
                  ))}
                </div>
              </div>

              {/* Lab Console Mock / Submit Section */}
              <div style={{
                background: 'var(--bg-dark)',
                borderRadius: '8px',
                border: '1px solid rgba(255, 255, 255, 0.05)',
                padding: '24px',
                display: 'flex',
                flexDirection: 'column',
                alignItems: 'center',
                textAlign: 'center',
                boxShadow: 'inset 0 0 20px rgba(0, 0, 0, 0.3)'
              }}>
                {labSubmitted[lab.id] ? (
                  <div>
                    <Award size={48} color="var(--color-green)" style={{ marginBottom: '12px' }} />
                    <h3 style={{ color: 'var(--color-green)', fontSize: '1.2rem', marginBottom: '6px' }}>
                      BÁO CÁO LAB THÀNH CÔNG!
                    </h3>
                    <p style={{ fontSize: '0.85rem', color: 'var(--text-muted)', maxWidth: '400px', margin: '0 auto' }}>
                      Bạn đã hoàn thành mọi thử thách thực hành của Module này và gửi cờ (Flag) xác nhận thành công.
                    </p>
                  </div>
                ) : (
                  <div>
                    <Award size={36} color="var(--text-muted)" style={{ marginBottom: '12px' }} />
                    <h3 style={{ fontSize: '1.1rem', marginBottom: '8px' }}>
                      XÁC NHẬN HOÀN THÀNH LAB
                    </h3>
                    <p style={{ fontSize: '0.85rem', color: 'var(--text-muted)', maxWidth: '500px', marginBottom: '16px' }}>
                      Sau khi thực hành xong các bước trên máy Kali Linux ảo của bạn, hãy nhập kết quả (ví dụ mã Hash bẻ khóa được hoặc Flag thu thập) vào đây để hoàn tất.
                    </p>
                    <div style={{ display: 'flex', gap: '10px', justifyContent: 'center', width: '100%', maxWidth: '400px', margin: '0 auto' }}>
                      <input 
                        type="text" 
                        placeholder="Nhập flag hoặc kết quả..." 
                        style={{
                          background: 'rgba(0, 0, 0, 0.5)',
                          border: '1px solid rgba(255, 255, 255, 0.1)',
                          padding: '10px 14px',
                          borderRadius: '6px',
                          color: '#fff',
                          outline: 'none',
                          fontSize: '0.85rem',
                          flexGrow: 1
                        }}
                      />
                      <button
                        onClick={() => handleLabSubmit(lab.id)}
                        className="cyber-btn cyber-btn-success"
                      >
                        NỘP BÁO CÁO
                      </button>
                    </div>
                  </div>
                )}
              </div>
            </div>
          ))
        )}
      </div>
    </div>
  );
}
