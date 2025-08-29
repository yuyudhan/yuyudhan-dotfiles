// surfingkeys/surfing-keys-basic.js

// Domain exclusion list - add domains/subdomains where SurfingKeys should not apply
const EXCLUDED_DOMAINS = [
    // 'docs.google.com',
    // 'sheets.google.com',
    // 'slides.google.com',
    // 'mail.google.com',
    // 'calendar.google.com',
    // 'drive.google.com',
    // 'youtube.com',
    // 'netflix.com',
    // 'github.com'
];

// Check if current domain should be excluded
function shouldExclude() {
    const hostname = window.location.hostname.toLowerCase();
    return EXCLUDED_DOMAINS.some(domain =>
        hostname === domain || hostname.endsWith('.' + domain)
    );
}

// Early exit if domain is excluded
if (shouldExclude()) {
    return;
}

// ==========================================
// SECTION: BASIC SETTINGS
// ==========================================
settings.leaderKeyDelay = 10;
settings.scrollStepSize = 200;
settings.focusAfterClosed = "left";
settings.newTabPosition = "right";
settings.defaultSearchEngine = 'g';
settings.hintAlign = 'left';
settings.omnibarPosition = 'bottom';
settings.focusFirstCandidate = false;
settings.tabsThreshold = 0;
settings.modeAfterYank = 'Normal';

// ==========================================
// SECTION: KEY MAPPINGS
// ==========================================

// Enhanced link opening
api.map('F', 'C'); // Open in new tab but don't switch to it
api.map('MF', 'cf'); // Open multiple links in new tabs

// Tab navigation improvements
api.unmap('H');
api.unmap('L');
api.map('H', 'E');  // Move to left tab
api.map('L', 'R');  // Move to right tab

// History navigation
api.unmap('J');
api.unmap('K');
api.map('K', 'S'); // Back in history
api.map('J', 'D'); // Forward in history

// Image interaction
api.map('<Space>zci', 'q');

// ==========================================
// SECTION: CUSTOM COMMANDS
// ==========================================

// Spiritual greeting
api.mapkey('<Space>zom', 'Spiritual greeting', function() {
    api.Front.showPopup('🕉️ Har Har Mahadev ! Om Namah Shivay ! 🕉️');
});

// New tab with custom shortcut
api.mapkey('<Space>zon', 'Open new tab', function() {
    api.RUNTIME('openLink', {
        url: "about:newtab",
        tab: { tabbed: true }
    });
});

// Tab positioning commands
api.mapkey('<Space>z<', 'Move tab left', function() {
    api.RUNTIME('moveTab', { step: -1 });
});

api.mapkey('<Space>z>', 'Move tab right', function() {
    api.RUNTIME('moveTab', { step: 1 });
});

api.mapkey('<Space>zmt0', 'Move tab to first position', function() {
    api.RUNTIME("getTabs", {}, function(response) {
        if (response.tabs && response.tabs.length > 0) {
            const activeTab = response.tabs.find(t => t.active);
            if (activeTab) {
                api.RUNTIME("tabsMove", {
                    tabIds: [activeTab.id],
                    moveProperties: { index: 0 }
                });
            }
        }
    });
});

api.mapkey('<Space>zmt$', 'Move tab to last position', function() {
    api.RUNTIME("getTabs", {}, function(response) {
        if (response.tabs && response.tabs.length > 0) {
            const activeTab = response.tabs.find(t => t.active);
            if (activeTab) {
                const lastIndex = response.tabs.length - 1;
                api.RUNTIME("tabsMove", {
                    tabIds: [activeTab.id],
                    moveProperties: { index: lastIndex }
                });
            }
        }
    });
});

// ==========================================
// SECTION: ELEGANT THEME & STYLING
// ==========================================
settings.theme = `
/* Global font override for entire page */
html, body, * {
    font-family: "JetBrainsMono Nerd Font", "JetBrains Mono", "SF Mono", "Monaco", monospace !important;
}

/* Dark Reader compatibility for global font */
[data-darkreader-scheme="dark"] html,
[data-darkreader-scheme="dark"] body,
[data-darkreader-scheme="dark"] * {
    font-family: "JetBrainsMono Nerd Font", "JetBrains Mono", "SF Mono", "Monaco", monospace !important;
}

:root {
    --sk-bg: #1a1b26;
    --sk-bg-alt: #24283b;
    --sk-surface: #2a2d3a;
    --sk-overlay: #3b4261;
    --sk-text: #c0caf5;
    --sk-text-dim: #9aa5ce;
    --sk-accent: #7aa2f7;
    --sk-accent-alt: #bb9af7;
    --sk-success: #9ece6a;
    --sk-warning: #e0af68;
    --sk-error: #f7768e;
    --sk-border: #414868;
    --sk-shadow: rgba(0, 0, 0, 0.4);
    --sk-font: "JetBrainsMono Nerd Font", "JetBrains Mono", "SF Mono", "Monaco", monospace;
}

/* Dark Reader compatibility - Override Dark Reader's filters on SurfingKeys elements */
[data-darkreader-scheme="dark"] .sk_theme,
[data-darkreader-scheme="dark"] .sk_theme *,
[data-darkreader-scheme="dark"] #sk_status,
[data-darkreader-scheme="dark"] #sk_find,
[data-darkreader-scheme="dark"] #sk_popup,
[data-darkreader-scheme="dark"] #sk_keystroke,
[data-darkreader-scheme="dark"] #sk_keystroke *,
[data-darkreader-scheme="dark"] #sk_usage,
[data-darkreader-scheme="dark"] #sk_tabs,
[data-darkreader-scheme="dark"] #sk_bookmarks,
[data-darkreader-scheme="dark"] .sk_hints,
[data-darkreader-scheme="dark"] .sk_hints *,
[data-darkreader-scheme="dark"] #sk_omnibar,
[data-darkreader-scheme="dark"] #sk_omnibarSearchResult,
[data-darkreader-scheme="dark"] #sk_omnibarSearchResult *,
[data-darkreader-scheme="dark"] #sk_editor,
[data-darkreader-scheme="dark"] .ace-chrome,
[data-darkreader-scheme="dark"] .ace_gutter {
    filter: none !important;
    background-blend-mode: normal !important;
    mix-blend-mode: normal !important;
}

/* Force our styles to override Dark Reader modifications */
html[data-darkreader-scheme="dark"] .sk_theme,
html[data-darkreader-scheme="dark"] #sk_status,
html[data-darkreader-scheme="dark"] #sk_find,
html[data-darkreader-scheme="dark"] #sk_popup,
html[data-darkreader-scheme="dark"] #sk_keystroke,
html[data-darkreader-scheme="dark"] #sk_usage,
html[data-darkreader-scheme="dark"] #sk_tabs,
html[data-darkreader-scheme="dark"] #sk_bookmarks {
    background-color: var(--sk-bg) !important;
    color: var(--sk-text) !important;
    border-color: var(--sk-border) !important;
}

/* Dark Reader specific overrides for input elements */
[data-darkreader-scheme="dark"] .sk_theme input,
html[data-darkreader-scheme="dark"] .sk_theme input {
    background-color: var(--sk-bg-alt) !important;
    color: var(--sk-text) !important;
    border-color: var(--sk-border) !important;
    filter: none !important;
}

/* Dark Reader specific overrides for hints */
[data-darkreader-scheme="dark"] .sk_hints,
html[data-darkreader-scheme="dark"] .sk_hints {
    background-color: var(--sk-accent) !important;
    color: var(--sk-bg) !important;
    filter: none !important;
}

[data-darkreader-scheme="dark"] .sk_hints.focused,
html[data-darkreader-scheme="dark"] .sk_hints.focused {
    background-color: var(--sk-accent-alt) !important;
    color: var(--sk-bg) !important;
    filter: none !important;
}

/* Dark Reader specific overrides for omnibar results */
[data-darkreader-scheme="dark"] .sk_theme #sk_omnibarSearchResult ul li,
html[data-darkreader-scheme="dark"] .sk_theme #sk_omnibarSearchResult ul li {
    background-color: transparent !important;
    color: var(--sk-text) !important;
    border-color: rgba(65, 72, 104, 0.3) !important;
    filter: none !important;
}

[data-darkreader-scheme="dark"] .sk_theme #sk_omnibarSearchResult ul li:nth-child(odd),
html[data-darkreader-scheme="dark"] .sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background-color: rgba(36, 40, 59, 0.5) !important;
    filter: none !important;
}

[data-darkreader-scheme="dark"] .sk_theme #sk_omnibarSearchResult ul li.focused,
html[data-darkreader-scheme="dark"] .sk_theme #sk_omnibarSearchResult ul li.focused {
    background-color: var(--sk-overlay) !important;
    border-left-color: var(--sk-accent) !important;
    filter: none !important;
}

/* Base theme styling */
.sk_theme {
    font-family: var(--sk-font) !important;
    font-size: 14px !important;
    background: var(--sk-bg) !important;
    color: var(--sk-text) !important;
    border-radius: 8px !important;
    border: 1px solid var(--sk-border) !important;
    box-shadow: 0 8px 32px var(--sk-shadow) !important;
    backdrop-filter: blur(16px) !important;
}

/* Input styling */
.sk_theme input {
    color: var(--sk-text) !important;
    background: var(--sk-bg-alt) !important;
    border: 1px solid var(--sk-border) !important;
    border-radius: 6px !important;
    padding: 10px 14px !important;
    font-family: var(--sk-font) !important;
    font-size: 14px !important;
    outline: none !important;
    transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1) !important;
}

.sk_theme input:focus {
    border-color: var(--sk-accent) !important;
    box-shadow: 0 0 0 3px rgba(122, 162, 247, 0.12) !important;
    background: var(--sk-surface) !important;
}

/* URL and link styling */
.sk_theme .url {
    color: var(--sk-accent) !important;
    text-decoration: none !important;
    transition: color 0.2s ease !important;
}

.sk_theme .url:hover {
    color: var(--sk-accent-alt) !important;
    text-decoration: underline !important;
}

/* Omnibar highlighting */
.sk_theme .omnibar_highlight {
    color: var(--sk-accent-alt) !important;
    font-weight: 600 !important;
    text-decoration: none !important;
    background: rgba(187, 154, 247, 0.15) !important;
    padding: 2px 4px !important;
    border-radius: 3px !important;
}

.sk_theme .omnibar_timestamp {
    color: var(--sk-warning) !important;
    font-size: 12px !important;
    font-weight: 500 !important;
    margin-right: 8px !important;
}

.sk_theme .omnibar_visitcount {
    color: var(--sk-success) !important;
    background: rgba(158, 206, 106, 0.12) !important;
    font-size: 11px !important;
    font-weight: 600 !important;
    padding: 3px 7px !important;
    border-radius: 12px !important;
    margin-left: 6px !important;
}

/* Search results styling */
.sk_theme #sk_omnibarSearchResult ul li {
    padding: 12px 16px !important;
    border-bottom: 1px solid rgba(65, 72, 104, 0.3) !important;
    transition: all 0.15s ease !important;
}

.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background: rgba(36, 40, 59, 0.5) !important;
}

.sk_theme #sk_omnibarSearchResult ul li.focused {
    background: var(--sk-overlay) !important;
    border-left: 4px solid var(--sk-accent) !important;
    padding-left: 12px !important;
    transform: translateX(2px) !important;
}

/* Status bar */
#sk_status {
    font-family: var(--sk-font) !important;
    font-size: 13px !important;
    background: var(--sk-bg) !important;
    color: var(--sk-text-dim) !important;
    padding: 8px 12px !important;
    border-radius: 6px !important;
    border: 1px solid var(--sk-border) !important;
    position: fixed !important;
    bottom: 20px !important;
    right: 20px !important;
    opacity: 0.8 !important;
    z-index: 9999 !important;
    backdrop-filter: blur(8px) !important;
}

/* Find dialog */
#sk_find {
    font-family: var(--sk-font) !important;
    font-size: 14px !important;
    background: var(--sk-bg) !important;
    color: var(--sk-text) !important;
    padding: 10px 16px !important;
    border: 1px solid var(--sk-border) !important;
    border-radius: 8px !important;
    position: fixed !important;
    top: 20px !important;
    left: 50% !important;
    transform: translateX(-50%) !important;
    z-index: 9999 !important;
    box-shadow: 0 8px 32px var(--sk-shadow) !important;
    backdrop-filter: blur(16px) !important;
}

/* Hints styling - more elegant and refined */
.sk_hints, .sk_hints > * {
    font-family: var(--sk-font) !important;
    font-size: 13px !important;
    font-weight: 700 !important;
    background: var(--sk-accent) !important;
    color: var(--sk-bg) !important;
    padding: 6px 9px !important;
    border-radius: 6px !important;
    border: none !important;
    box-shadow: 0 4px 16px rgba(122, 162, 247, 0.3) !important;
    line-height: 1 !important;
    letter-spacing: 0.5px !important;
    transition: all 0.15s cubic-bezier(0.4, 0, 0.2, 1) !important;
}

.sk_hints.focused, .sk_hints .focused {
    background: var(--sk-accent-alt) !important;
    transform: scale(1.08) !important;
    box-shadow: 0 6px 20px rgba(187, 154, 247, 0.4) !important;
}

/* Keystroke display */
#sk_keystroke {
    background: var(--sk-bg) !important;
    color: var(--sk-text) !important;
    font-family: var(--sk-font) !important;
    font-size: 13px !important;
    padding: 10px 14px !important;
    border-radius: 8px !important;
    border: 1px solid var(--sk-border) !important;
    position: fixed !important;
    bottom: 20px !important;
    left: 20px !important;
    z-index: 9999 !important;
    box-shadow: 0 8px 32px var(--sk-shadow) !important;
    backdrop-filter: blur(16px) !important;
}

#sk_keystroke kbd {
    background: var(--sk-overlay) !important;
    color: var(--sk-warning) !important;
    padding: 4px 8px !important;
    margin: 0 2px !important;
    border-radius: 4px !important;
    font-size: 11px !important;
    font-weight: 600 !important;
    border: 1px solid var(--sk-border) !important;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2) !important;
}

/* Usage, tabs, and bookmarks panels */
#sk_usage, #sk_tabs, #sk_bookmarks {
    background: var(--sk-bg) !important;
    color: var(--sk-text) !important;
    font-family: var(--sk-font) !important;
    font-size: 14px !important;
    border: 1px solid var(--sk-border) !important;
    border-radius: 12px !important;
    box-shadow: 0 16px 64px var(--sk-shadow) !important;
    max-width: 900px !important;
    margin: 40px auto !important;
    backdrop-filter: blur(16px) !important;
}

#sk_tabs .sk_tab {
    padding: 12px 16px !important;
    border-bottom: 1px solid rgba(65, 72, 104, 0.3) !important;
    transition: background 0.15s ease !important;
}

#sk_tabs .sk_tab:hover {
    background: var(--sk-bg-alt) !important;
}

#sk_tabs .sk_tab_title {
    color: var(--sk-accent) !important;
    font-weight: 600 !important;
}

#sk_tabs .sk_tab_hint {
    color: var(--sk-accent-alt) !important;
    font-weight: 700 !important;
    margin-right: 10px !important;
}

/* Popup styling */
#sk_popup {
    background: var(--sk-bg) !important;
    color: var(--sk-text) !important;
    border-left: 4px solid var(--sk-accent) !important;
    border-radius: 8px !important;
    padding: 14px 18px !important;
    position: fixed !important;
    top: 20px !important;
    right: 20px !important;
    max-width: 400px !important;
    z-index: 9999 !important;
    font-family: var(--sk-font) !important;
    font-size: 14px !important;
    box-shadow: 0 12px 48px var(--sk-shadow) !important;
    backdrop-filter: blur(16px) !important;
    animation: slideInRight 0.3s cubic-bezier(0.4, 0, 0.2, 1) !important;
}

@keyframes slideInRight {
    from {
        opacity: 0;
        transform: translateX(100%);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

/* Editor styling */
#sk_editor {
    background: var(--sk-bg) !important;
    color: var(--sk-text) !important;
    font-family: var(--sk-font) !important;
    font-size: 14px !important;
    border: 1px solid var(--sk-border) !important;
    border-radius: 8px !important;
}

.ace-chrome .ace_gutter {
    background: var(--sk-bg) !important;
    color: var(--sk-text-dim) !important;
    font-family: var(--sk-font) !important;
    border-right: 1px solid var(--sk-border) !important;
}

.ace_gutter-active-line {
    background: var(--sk-bg-alt) !important;
    color: var(--sk-accent) !important;
    border-left: 3px solid var(--sk-accent) !important;
}
`;

