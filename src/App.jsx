import React, { useState, useEffect } from 'react';
import Navigation from './components/Navigation';
import CourseRoadmap from './components/CourseRoadmap';
import LessonContent from './components/LessonContent';
import AiSimulator from './components/AiSimulator';
import CodeRepository from './components/CodeRepository';

import { coursesData } from './data/syllabus';
import { codeSamples } from './data/codeSamples';

function App() {
  const [activeTab, setActiveTab] = useState('roadmap');
  const [activeCourse, setActiveCourse] = useState('5_ARTIFICIAL_INTELLIGENCE');
  
  const coursesList = Object.values(coursesData);
  const activeCourseData = coursesData[activeCourse] || coursesData['5_ARTIFICIAL_INTELLIGENCE'];

  const [activeModule, setActiveModule] = useState(activeCourseData.syllabus[0].id);
  const [activeLesson, setActiveLesson] = useState(activeCourseData.syllabus[0].lessons[0]);
  
  const [completedLessons, setCompletedLessons] = useState(() => {
    const saved = localStorage.getItem('completedLessons');
    return saved ? JSON.parse(saved) : [];
  });

  // Reset active module and lesson when active course changes
  useEffect(() => {
    if (activeCourseData && activeCourseData.syllabus.length > 0) {
      const firstMod = activeCourseData.syllabus[0];
      setActiveModule(firstMod.id);
      if (firstMod.lessons && firstMod.lessons.length > 0) {
        setActiveLesson(firstMod.lessons[0]);
      }
    }
  }, [activeCourse]);

  useEffect(() => {
    localStorage.setItem('completedLessons', JSON.stringify(completedLessons));
  }, [completedLessons]);

  const toggleLessonComplete = (lessonId) => {
    setCompletedLessons((prev) => {
      if (prev.includes(lessonId)) {
        return prev.filter((id) => id !== lessonId);
      } else {
        return [...prev, lessonId];
      }
    });
  };

  return (
    <div style={{ minHeight: '100vh', display: 'flex', flexDirection: 'column' }} className="scanline">
      {/* Navigation HUD */}
      <Navigation 
        activeTab={activeTab} 
        setActiveTab={setActiveTab} 
        activeCourse={activeCourse}
        setActiveCourse={setActiveCourse}
        coursesList={coursesList}
      />

      {/* Main Content Area */}
      <main style={{
        flexGrow: 1,
        maxWidth: '1200px',
        width: '100%',
        margin: '0 auto',
        padding: '0 24px',
        zIndex: 10
      }}>
        {activeTab === 'roadmap' && (
          <CourseRoadmap 
            syllabus={activeCourseData.syllabus} 
            activeModule={activeModule}
            setActiveModule={setActiveModule}
            activeLesson={activeLesson}
            setActiveLesson={setActiveLesson}
            completedLessons={completedLessons}
            setActiveTab={setActiveTab}
          />
        )}

        {activeTab === 'lessons' && (
          <LessonContent 
            syllabus={activeCourseData.syllabus}
            activeModule={activeModule}
            setActiveModule={setActiveModule}
            activeLesson={activeLesson}
            setActiveLesson={setActiveLesson}
            completedLessons={completedLessons}
            toggleLessonComplete={toggleLessonComplete}
          />
        )}

        {activeTab === 'simulator' && (
          <AiSimulator />
        )}

        {activeTab === 'code' && (
          <CodeRepository codeSamples={codeSamples} />
        )}
      </main>

      {/* Footer */}
      <footer style={{
        borderTop: '1px solid rgba(255, 255, 255, 0.05)',
        padding: '20px 24px',
        textAlign: 'center',
        background: 'rgba(7, 8, 11, 0.9)',
        color: 'var(--text-muted)',
        fontSize: '0.75rem',
        fontFamily: 'var(--font-cyber)',
        marginTop: '40px',
        zIndex: 10
      }}>
        <div style={{
          maxWidth: '1200px',
          margin: '0 auto',
          display: 'flex',
          justifyContent: 'space-between',
          alignItems: 'center',
          flexWrap: 'wrap',
          gap: '12px'
        }}>
          <span>© 2026 FULLSTACK4KID ACADEMY. ALL RIGHTS RESERVED.</span>
          <div style={{ display: 'flex', gap: '16px' }}>
            <span style={{ color: 'var(--color-cyan)' }}>ETHICAL HACKING ONLY</span>
            <span>•</span>
            <span style={{ color: 'var(--color-green)' }}>POWERED BY AI</span>
          </div>
        </div>
      </footer>
    </div>
  );
}

export default App;
