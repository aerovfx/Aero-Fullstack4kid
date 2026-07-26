import React, { useState } from 'react';
import { Search, Copy, Check, Terminal, FileCode, Cpu, Sparkles } from 'lucide-react';

export default function CodeRepository({ codeSamples }) {
  const [searchTerm, setSearchTerm] = useState('');
  const [filterLang, setFilterLang] = useState('all');
  const [copiedId, setCopiedId] = useState(null);

  const handleCopy = (code, id) => {
    navigator.clipboard.writeText(code);
    setCopiedId(id);
    setTimeout(() => {
      setCopiedId(null);
    }, 2000);
  };

  const getLangBadge = (lang) => {
    switch (lang) {
      case 'python':
        return (
          <span style={{
            fontSize: '0.65rem',
            color: '#ffde59',
            border: '1px solid rgba(255, 222, 89, 0.3)',
            background: 'rgba(255, 222, 89, 0.05)',
            padding: '4px 8px',
            borderRadius: '4px',
            fontFamily: 'var(--font-cyber)',
            textTransform: 'uppercase',
            display: 'flex',
            alignItems: 'center',
            gap: '4px'
          }}>
            <FileCode size={10} />
            <span>Python 3</span>
          </span>
        );
      case 'cpp':
        return (
          <span style={{
            fontSize: '0.65rem',
            color: '#659ad2',
            border: '1px solid rgba(101, 154, 210, 0.3)',
            background: 'rgba(101, 154, 210, 0.05)',
            padding: '4px 8px',
            borderRadius: '4px',
            fontFamily: 'var(--font-cyber)',
            textTransform: 'uppercase',
            display: 'flex',
            alignItems: 'center',
            gap: '4px'
          }}>
            <Cpu size={10} />
            <span>C++ 11+</span>
          </span>
        );
      default:
        return (
          <span style={{
            fontSize: '0.65rem',
            color: 'var(--color-purple)',
            border: '1px solid rgba(157, 78, 237, 0.3)',
            background: 'rgba(157, 78, 237, 0.05)',
            padding: '4px 8px',
            borderRadius: '4px',
            fontFamily: 'var(--font-cyber)',
            textTransform: 'uppercase',
            display: 'flex',
            alignItems: 'center',
            gap: '4px'
          }}>
            <Sparkles size={10} />
            <span>AI Sec-Tool</span>
          </span>
        );
    }
  };

  // Filter logic
  const filteredSamples = codeSamples.filter(sample => {
    const matchesSearch = sample.title.toLowerCase().includes(searchTerm.toLowerCase()) || 
                          sample.description.toLowerCase().includes(searchTerm.toLowerCase()) ||
                          sample.code.toLowerCase().includes(searchTerm.toLowerCase());
    
    if (filterLang === 'all') return matchesSearch;
    if (filterLang === 'python') return sample.language === 'python' && matchesSearch;
    if (filterLang === 'cpp') return sample.language === 'cpp' && matchesSearch;
    if (filterLang === 'ai') return sample.language !== 'python' && sample.language !== 'cpp' && matchesSearch;
    
    return matchesSearch;
  });

  return (
    <div style={{ padding: '24px 0', maxWidth: '1000px', margin: '0 auto' }}>
      
      {/* Header section with search and filter controls */}
      <div style={{
        display: 'flex',
        justifyContent: 'space-between',
        alignItems: 'center',
        flexWrap: 'wrap',
        gap: '16px',
        marginBottom: '30px',
        borderBottom: '1px solid rgba(255, 255, 255, 0.05)',
        paddingBottom: '20px'
      }}>
        <div>
          <h2 style={{ fontSize: '1.25rem', fontFamily: 'var(--font-cyber)', display: 'flex', alignItems: 'center', gap: '8px' }}>
            <Terminal size={18} color="var(--color-cyan)" />
            <span>KHO MÃ NGUỒN SECURITY MẪU</span>
          </h2>
          <span style={{ fontSize: '0.75rem', color: 'var(--text-muted)' }}>
            Tổng hợp mã nguồn mẫu tối ưu chạy thật bằng Python, C++ và các công cụ bảo mật thông minh
          </span>
        </div>

        {/* Controls */}
        <div style={{ display: 'flex', gap: '12px', flexWrap: 'wrap', alignItems: 'center' }}>
          {/* Search bar */}
          <div style={{
            display: 'flex',
            alignItems: 'center',
            gap: '8px',
            background: 'var(--bg-panel)',
            border: '1px solid rgba(255, 255, 255, 0.05)',
            padding: '8px 12px',
            borderRadius: '6px',
            width: '240px'
          }}>
            <Search size={14} color="var(--text-muted)" />
            <input
              type="text"
              placeholder="Tìm kiếm mã nguồn..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              style={{
                background: 'transparent',
                border: 'none',
                color: '#fff',
                outline: 'none',
                fontSize: '0.8rem',
                width: '100%'
              }}
            />
          </div>

          {/* Lang Filters */}
          <div style={{
            display: 'flex',
            background: 'rgba(22, 27, 34, 0.5)',
            padding: '2px',
            borderRadius: '6px',
            border: '1px solid rgba(255, 255, 255, 0.03)'
          }}>
            {[
              { id: 'all', label: 'Tất cả' },
              { id: 'python', label: 'Python' },
              { id: 'cpp', label: 'C++' },
              { id: 'ai', label: 'AI Tools' }
            ].map(tab => (
              <button
                key={tab.id}
                onClick={() => setFilterLang(tab.id)}
                style={{
                  background: filterLang === tab.id ? 'rgba(0, 240, 255, 0.08)' : 'transparent',
                  color: filterLang === tab.id ? 'var(--color-cyan)' : 'var(--text-muted)',
                  border: 'none',
                  padding: '6px 12px',
                  borderRadius: '4px',
                  cursor: 'pointer',
                  fontSize: '0.75rem',
                  fontFamily: 'var(--font-cyber)',
                  transition: 'var(--transition)'
                }}
              >
                {tab.label}
              </button>
            ))}
          </div>
        </div>
      </div>

      {/* Code cards list */}
      <div style={{ display: 'flex', flexDirection: 'column', gap: '30px' }}>
        {filteredSamples.length > 0 ? (
          filteredSamples.map((sample) => (
            <div 
              key={sample.id} 
              className="cyber-panel"
              style={{
                background: 'rgba(22, 27, 34, 0.45)',
                borderLeft: `4px solid ${sample.language === 'python' ? '#ffde59' : sample.language === 'cpp' ? '#659ad2' : 'var(--color-purple)'}`,
                padding: '24px'
              }}
            >
              {/* Header card info */}
              <div style={{
                display: 'flex',
                justifyContent: 'space-between',
                alignItems: 'flex-start',
                marginBottom: '14px',
                flexWrap: 'wrap',
                gap: '12px'
              }}>
                <div>
                  <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '6px' }}>
                    <h3 style={{ fontSize: '1.1rem', fontFamily: 'var(--font-cyber)' }}>
                      {sample.title}
                    </h3>
                    {getLangBadge(sample.language)}
                  </div>
                  <p style={{ fontSize: '0.85rem', color: 'var(--text-muted)', margin: 0 }}>
                    {sample.description}
                  </p>
                </div>

                <button
                  onClick={() => handleCopy(sample.code, sample.id)}
                  style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: '6px',
                    background: 'transparent',
                    border: '1px solid rgba(255, 255, 255, 0.08)',
                    color: copiedId === sample.id ? 'var(--color-green)' : 'var(--text-main)',
                    borderColor: copiedId === sample.id ? 'var(--color-green)' : 'rgba(255, 255, 255, 0.08)',
                    padding: '8px 12px',
                    borderRadius: '6px',
                    cursor: 'pointer',
                    fontSize: '0.75rem',
                    fontFamily: 'var(--font-cyber)',
                    transition: 'var(--transition)'
                  }}
                >
                  {copiedId === sample.id ? <Check size={12} /> : <Copy size={12} />}
                  <span>{copiedId === sample.id ? 'ĐÃ COPIED!' : 'SAO CHÉP'}</span>
                </button>
              </div>

              {/* Code viewer block */}
              <pre style={{
                background: '#07090e',
                border: '1px solid rgba(255, 255, 255, 0.05)',
                borderRadius: '8px',
                padding: '16px',
                overflowX: 'auto',
                maxHeight: '400px',
                fontFamily: 'var(--font-code)',
                fontSize: '0.8rem',
                color: '#e6edf3',
                lineHeight: '1.5'
              }}>
                <code>{sample.code}</code>
              </pre>
            </div>
          ))
        ) : (
          <div style={{
            textAlign: 'center',
            padding: '40px',
            color: 'var(--text-muted)',
            fontFamily: 'var(--font-cyber)',
            fontSize: '0.9rem'
          }}>
            Không tìm thấy mã nguồn mẫu nào phù hợp với từ khóa tìm kiếm.
          </div>
        )}
      </div>
    </div>
  );
}
