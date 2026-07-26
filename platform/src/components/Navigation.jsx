import React from 'react';
import { Shield, BookOpen, Terminal, Sparkles, Code, Activity, Layers } from 'lucide-react';

export default function Navigation({ activeTab, setActiveTab, activeCourse, setActiveCourse, coursesList }) {
  const tabs = [
    { id: 'roadmap', label: 'Roadmap', icon: Shield },
    { id: 'lessons', label: 'Bài học & Lab', icon: BookOpen },
    { id: 'simulator', label: 'Trình giả lập AI', icon: Sparkles },
    { id: 'code', label: 'Kho Code mẫu', icon: Code },
  ];

  return (
    <nav style={{
      borderBottom: '1px solid rgba(255, 255, 255, 0.05)',
      background: 'rgba(7, 8, 11, 0.85)',
      backdropFilter: 'blur(16px)',
      position: 'sticky',
      top: 0,
      zIndex: 100,
      padding: '12px 24px',
    }}>
      <div style={{
        maxWidth: '1200px',
        margin: '0 auto',
        display: 'flex',
        justifyContent: 'space-between',
        alignItems: 'center',
        flexWrap: 'wrap',
        gap: '16px'
      }}>
        {/* Logo and Brand */}
        <div style={{ display: 'flex', alignItems: 'center', gap: '16px' }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
            <div style={{
              background: 'linear-gradient(135deg, var(--color-cyan), var(--color-purple))',
              padding: '8px',
              borderRadius: '8px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              boxShadow: '0 0 15px rgba(0, 240, 255, 0.2)'
            }}>
              <Terminal size={22} color="#07080b" strokeWidth={2.5} />
            </div>
            <div>
              <h1 style={{
                fontSize: '1.2rem',
                fontWeight: 800,
                letterSpacing: '0.15em',
                background: 'linear-gradient(to right, #ffffff, #8b949e)',
                WebkitBackgroundClip: 'text',
                WebkitTextFillColor: 'transparent',
                fontFamily: 'var(--font-cyber)',
                margin: 0
              }}>
                FULLSTACK<span style={{ color: 'var(--color-cyan)', textShadow: 'var(--glow-cyan)' }}>4KID</span>
              </h1>
              <span style={{
                fontSize: '0.65rem',
                color: 'var(--text-muted)',
                letterSpacing: '0.2em',
                textTransform: 'uppercase',
                display: 'block',
                marginTop: '-2px'
              }}>
                Học Viện Đa Khoá Học
              </span>
            </div>
          </div>

          {/* Course Selector Dropdown */}
          <div style={{
            display: 'flex',
            alignItems: 'center',
            gap: '8px',
            background: 'rgba(22, 27, 34, 0.6)',
            border: '1px solid rgba(255, 255, 255, 0.08)',
            padding: '4px 10px',
            borderRadius: '8px'
          }}>
            <Layers size={12} color="var(--color-cyan)" />
            <select
              value={activeCourse}
              onChange={(e) => setActiveCourse(e.target.value)}
              style={{
                background: 'transparent',
                color: 'var(--text-main)',
                border: 'none',
                outline: 'none',
                fontFamily: 'var(--font-cyber)',
                fontSize: '0.75rem',
                cursor: 'pointer',
                letterSpacing: '0.05em'
              }}
            >
              {coursesList.map(course => (
                <option 
                  key={course.id} 
                  value={course.id}
                  style={{ background: 'var(--bg-dark)', color: '#fff' }}
                >
                  {course.title.toUpperCase()}
                </option>
              ))}
            </select>
          </div>
        </div>

        {/* Navigation Tabs */}
        <div style={{
          display: 'flex',
          background: 'rgba(22, 27, 34, 0.5)',
          padding: '4px',
          borderRadius: '10px',
          border: '1px solid rgba(255, 255, 255, 0.03)'
        }}>
          {tabs.map((tab) => {
            const Icon = tab.icon;
            const isActive = activeTab === tab.id;
            return (
              <button
                key={tab.id}
                onClick={() => setActiveTab(tab.id)}
                style={{
                  display: 'flex',
                  alignItems: 'center',
                  gap: '8px',
                  padding: '8px 16px',
                  borderRadius: '8px',
                  border: 'none',
                  background: isActive ? 'rgba(0, 240, 255, 0.08)' : 'transparent',
                  color: isActive ? 'var(--color-cyan)' : 'var(--text-muted)',
                  cursor: 'pointer',
                  fontFamily: 'var(--font-cyber)',
                  fontSize: '0.8rem',
                  letterSpacing: '0.05em',
                  transition: 'var(--transition)',
                  borderBottom: isActive ? '1px solid var(--color-cyan)' : '1px solid transparent',
                  boxShadow: isActive ? 'inset 0 0 10px rgba(0, 240, 255, 0.03)' : 'none',
                }}
                className={isActive ? 'glitch-text' : ''}
              >
                <Icon size={14} />
                <span>{tab.label}</span>
              </button>
            );
          })}
        </div>

        {/* Telemetry Status Indicators */}
        <div style={{
          display: 'flex',
          alignItems: 'center',
          gap: '16px',
          fontSize: '0.75rem',
          color: 'var(--text-muted)',
          fontFamily: 'var(--font-cyber)'
        }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '6px' }}>
            <span className="glow-dot glow-dot-cyan pulse"></span>
            <span>SECURE_LINK</span>
          </div>
          <div style={{ display: 'flex', alignItems: 'center', gap: '6px' }}>
            <Activity size={12} color="var(--color-green)" className="pulse" />
            <span>SYS_OK</span>
          </div>
        </div>
      </div>
    </nav>
  );
}
