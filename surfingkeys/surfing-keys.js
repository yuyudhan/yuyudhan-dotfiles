// FilePath: surfingkeys/surfing-keys.js

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

// ==========================================
// SECTION: Messages
// ==========================================
api.mapkey('<Space>zom', 'Spiritual greeting', function() {
    api.Front.showPopup('🕉️ Har Har Mahadev ! Om Namah Shivay ! 🕉️ (Escape to close).');
});

// ==========================================
// SECTION: BASIC SETTINGS
// ==========================================
settings.leaderKeyDelay = 10;                // Delay in ms before leader key triggers, can be any positive integer
settings.scrollStepSize = 200;                // Number of pixels to scroll with each keystroke, can be any positive integer
settings.focusAfterClosed = "left";           // Which tab to focus after closing current tab, options: "right", "left", "last"
settings.newTabPosition = "right";             // Where to place newly created tabs, options: "left", "right", "first", "last", "default"
settings.defaultSearchEngine = 'g';           // Default search engine to use, options: 'g' (Google), 'd' (DuckDuckGo), 'b' (Bing), 'w' (Wikipedia), etc.
settings.hintAlign = 'left';                  // Alignment of link hints, options: 'left', 'center', 'right'
settings.omnibarPosition = 'bottom';          // Position of the omnibar, options: 'bottom', 'middle', 'top'
settings.focusFirstCandidate = false;         // Whether to auto-focus the first candidate in omnibar, options: true, false
settings.tabsThreshold = 0;                   // Minimum number of tabs before showing the tabs list, 0 means always show
settings.modeAfterYank = 'Normal';            // Mode to enter after yanking text, options: 'Normal', 'Caret', etc.
settings.theme = "tokyo";                     // Theme name or custom CSS, can be a predefined theme name or custom CSS string

// ==========================================
// ==========================================
// ==========================================
// SECTION: KEY MAPPINGS
// ==========================================
// Use F to open hints that opens links in new tabs.
// api.unmap('C');
api.map('F', 'C'); // Open in new tab but don't go to that tab
api.map('<Space>FyF', 'cf'); // Open in new tab but don't go to that tab
api.map('F', 'C'); // Open in new tab but don't go to that tab

// === Rough notes===========================
// C opens in new tab but doesn't go ot that tab
// cf opens multiple links in new tab.
// ;m to mouse out last element
// ==========================================
// ==========================================

// Use MF to open multiple links in new tab.
api.map('MF', 'cf');

// Remap 'q' (click on image) to '<space>zci'
api.map('<Space>zci', 'q');

// Use capital H and L to move to tab left and right.
api.unmap('H');
api.unmap('L');
api.map('H', 'E');  // H maps to tab left
api.map('L', 'R');  // L maps to tab right

api.unmap('J');
api.unmap('K');
api.map('K', 'S'); // K maps to move up one in history
api.map('J', 'D'); // J maps to move down one in history

// ==========================================
// SECTION: CUSTOM COMMANDS
// ==========================================
// pressing space then z then o then n opens new tab
api.mapkey('<Space>zon', 'Open new tab', function() {
    api.RUNTIME('openLink', {
        url: "about:newtab",
        tab: {
            tabbed: true
        }
    });
});

// Move tab one position to the left
api.mapkey('<Space>z<', 'Move tab one position left', function() {
    api.RUNTIME('moveTab', {
        step: -1
    });
});

// Move tab one position to the right
api.mapkey('<Space>z>', 'Move tab one position right', function() {
    api.RUNTIME('moveTab', {
        step: 1
    });
});

// Move tab to first position (index 0)
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

// Move tab to last position
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
// SECTION: THEME
// ==========================================
settings.theme = `
/* LazyVim-inspired SurfingKeys Theme
   With elegant positioning and professional coding aesthetic */

/* Base Variables - Consistent color palette for LazyVim feel */
:root {
  --bg-dark: #1a1b26;
  --bg-medium: #24283b;
  --bg-light: #2c3043;
  --bg-highlight: #3b4261;
  --fg-normal: #c0caf5;
  --fg-bright: #ffffff;
  --fg-muted: #7982a9;
  --accent-blue: #7aa2f7;
  --accent-cyan: #2ac3de;
  --accent-purple: #bb9af7;
  --accent-green: #9ece6a;
  --accent-orange: #e0af68;
  --border-color: #3d425b;
  --shadow-color: rgba(0, 0, 0, 0.25);
}

/* Popup Notifications - Clean, subtle notifications with accent borders */
#sk_popup {
    color: var(--fg-normal);
    background-color: var(--bg-dark);
    border-left: 3px solid var(--accent-blue);
    border-radius: 4px;
    padding: 12px 16px;
    box-shadow: 0 4px 12px var(--shadow-color);
    text-align: left;
    font-family: "JetBrains Mono", "Fira Code", "SF Mono", monospace;
    font-weight: normal;
    line-height: 1.5;
    position: fixed;
    top: 16px;
    right: 16px;
    max-width: 380px;
    z-index: 9999;
}

/* General Theme Styling - Refined base styling with gentle borders and shadows */
.sk_theme {
    font-family: "JetBrains Mono", "Fira Code", "SF Mono", monospace;
    font-weight: normal;
    font-size: 14px !important;
    background: var(--bg-dark);
    color: var(--fg-normal);
    line-height: 1.5;
    border-radius: 6px;
    border: 1px solid var(--border-color);
    box-shadow: 0 6px 16px var(--shadow-color);
}

/* Table Body - Refined table styling for help pages */
.sk_theme tbody {
    color: var(--fg-normal);
    line-height: 1.6;
}

.sk_theme table {
    border-collapse: collapse;
    margin: 8px 0;
}

.sk_theme th {
    color: var(--accent-purple);
    border-bottom: 1px solid var(--border-color);
    padding: 6px 10px;
    text-align: left;
}

.sk_theme td {
    padding: 6px 10px;
    border-bottom: 1px solid var(--border-color);
}

/* Input Fields - Polished inputs with subtle focus effects */
.sk_theme input {
    color: var(--fg-normal);
    background-color: var(--bg-medium);
    border: 1px solid var(--border-color);
    border-radius: 4px;
    padding: 8px 12px;
    margin: 6px 0;
    font-family: inherit;
    font-size: 14px;
    outline: none;
    transition: border-color 0.2s, box-shadow 0.2s;
}

.sk_theme input:focus {
    border-color: var(--accent-blue);
    box-shadow: 0 0 0 2px rgba(122, 162, 247, 0.2);
}

/* URLs and Annotations - Refined link styling with hover effects */
.sk_theme .url {
    color: var(--accent-blue);
    text-decoration: none;
    transition: color 0.2s;
}

.sk_theme .url:hover {
    color: var(--accent-cyan);
    text-decoration: underline;
}

.sk_theme .annotation {
    color: var(--accent-cyan);
    font-style: italic;
    margin-left: 6px;
}

/* Omnibar Highlights and Metadata - Enhanced search result styling */
.sk_theme .omnibar_highlight {
    color: var(--accent-purple);
    font-weight: bold;
    text-decoration: underline;
    text-decoration-thickness: 2px;
    text-decoration-color: var(--accent-purple);
    text-underline-offset: 2px;
}

.sk_theme .omnibar_timestamp {
    color: var(--accent-orange);
    font-size: 0.9em;
    margin-right: 8px;
    opacity: 0.8;
}

.sk_theme .omnibar_visitcount {
    color: var(--accent-green);
    background: rgba(158, 206, 106, 0.1);
    font-size: 0.85em;
    padding: 2px 6px;
    border-radius: 10px;
    margin-left: 6px;
}

/* Omnibar Search Results - Refined result list with smooth transitions */
.sk_theme #sk_omnibarSearchResult {
    margin-top: 8px;
    border-radius: 6px;
    overflow: hidden;
}

.sk_theme #sk_omnibarSearchResult ul {
    padding: 0;
    margin: 0;
}

.sk_theme #sk_omnibarSearchResult ul li {
    padding: 8px 12px;
    transition: background 0.2s;
    border-bottom: 1px solid var(--border-color);
}

.sk_theme #sk_omnibarSearchResult ul li:last-child {
    border-bottom: none;
}

.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background: var(--bg-medium);
}

.sk_theme #sk_omnibarSearchResult ul li:nth-child(even) {
    background: var(--bg-dark);
}

.sk_theme #sk_omnibarSearchResult ul li.focused {
    background: var(--bg-highlight);
    border-left: 3px solid var(--accent-blue);
    padding-left: 9px;
}

/* Status and Find Bar - Minimal but clearly visible status indicators */
#sk_status {
    font-size: 14px !important;
    font-weight: bold;
    background: var(--bg-dark);
    color: var(--fg-bright);
    padding: 6px 10px;
    border-radius: 4px;
    border: 1px solid var(--border-color);
    box-shadow: 0 2px 8px var(--shadow-color);
    position: fixed;
    bottom: 16px;
    right: 16px;
    max-width: 200px;
    opacity: 0.9;
    z-index: 9999;
}

#sk_find {
    font-size: 14px !important;
    font-weight: bold;
    background: var(--bg-dark);
    color: var(--fg-bright);
    padding: 8px 12px;
    border: 1px solid var(--border-color);
    border-radius: 4px;
    position: fixed;
    top: 16px;
    left: 50%;
    transform: translateX(-50%);
    box-shadow: 0 4px 12px var(--shadow-color);
    z-index: 9999;
}

/* Hints Styling - Elegant, code-editor style hints that stand out without being obtrusive */
.sk_hints, .sk_hints > * {
    font-family: "JetBrains Mono", "Fira Code", monospace !important;
    font-size: 16px !important;
    font-weight: bold;
    background-color: var(--accent-blue);
    color: var(--bg-dark);
    padding: 4px 7px;
    border-radius: 4px;
    border: none;
    box-shadow: 0 2px 8px var(--shadow-color);
    line-height: 1;
    transition: all 0.1s;
}

.sk_hints .focused, .sk_hints.focused {
    background-color: var(--accent-purple);
    color: var(--bg-dark);
    transform: scale(1.05);
}

/* Keystroke display - Elegant key display that resembles code editor key hints */
#sk_keystroke {
    background-color: var(--bg-dark);
    color: var(--fg-normal);
    font-size: 14px;
    padding: 8px 12px;
    border-radius: 6px;
    border: 1px solid var(--border-color);
    box-shadow: 0 4px 12px var(--shadow-color);
    position: fixed;
    bottom: 16px;
    left: 16px;
    z-index: 9999;
    font-family: "JetBrains Mono", "Fira Code", monospace;
}

#sk_keystroke kbd {
    background: var(--bg-highlight);
    color: var(--accent-orange);
    padding: 3px 6px;
    margin: 0 2px;
    border-radius: 4px;
    font-family: inherit;
    font-size: 12px;
    box-shadow: 0 2px 0 1px var(--border-color);
    border: 1px solid var(--border-color);
}

/* Usage popup - Refined help screen with code editor styling */
#sk_usage {
    background-color: var(--bg-dark);
    color: var(--fg-normal);
    font-size: 14px;
    line-height: 1.6;
    border: 1px solid var(--border-color);
    border-radius: 6px;
    box-shadow: 0 8px 24px var(--shadow-color);
    padding: 16px;
    max-width: 800px;
    margin: 40px auto;
}

#sk_usage > * {
    margin-bottom: 12px;
}

#sk_usage kbd {
    background: var(--bg-highlight);
    color: var(--accent-orange);
    padding: 2px 5px;
    border-radius: 4px;
    font-family: inherit;
    font-size: 12px;
}

/* Tabs list - Clean tab switcher with hover effects */
#sk_tabs {
    background-color: var(--bg-dark);
    color: var(--fg-normal);
    font-size: 14px;
    border: 1px solid var(--border-color);
    border-radius: 6px;
    box-shadow: 0 8px 24px var(--shadow-color);
    max-width: 800px;
    margin: 40px auto;
    overflow: hidden;
}

#sk_tabs .sk_tab {
    padding: 8px 12px;
    border-bottom: 1px solid var(--border-color);
    transition: background 0.2s;
}

#sk_tabs .sk_tab_title {
    color: var(--accent-blue);
    font-weight: bold;
}

#sk_tabs .sk_tab_url {
    color: var(--fg-muted);
    font-size: 0.9em;
}

#sk_tabs .sk_tab_hint {
    color: var(--accent-purple);
    font-weight: bold;
    margin-right: 8px;
}

/* Bookmark panel - Refined bookmark interface */
#sk_bookmarks {
    background-color: var(--bg-dark);
    color: var(--fg-normal);
    border: 1px solid var(--border-color);
    border-radius: 6px;
    box-shadow: 0 8px 24px var(--shadow-color);
    max-width: 800px;
    margin: 40px auto;
}

/* Banner messages - Subtle system notifications */
#sk_banner {
    background-color: var(--bg-dark);
    color: var(--accent-green);
    border-bottom: 1px solid var(--border-color);
    font-size: 14px;
    font-weight: bold;
    padding: 8px 16px;
    text-align: center;
    box-shadow: 0 2px 8px var(--shadow-color);
}

#sk_editor {
    background-color: var(--bg-dark) !important;
    color: var(--fg-normal) !important;
    font-family: "JetBrains Mono", "Fira Code", "SF Mono", monospace !important;
    font-size: 14px !important;
    line-height: 1.5 !important;
    border: 1px solid var(--border-color) !important;
    border-radius: 4px !important;
    box-shadow: 0 4px 12px var(--shadow-color) !important;
}

.ace-chrome .ace_gutter{
    background-color: var(--bg-dark) !important;
    color: var(--fg-normal) !important;
    font-family: "JetBrains Mono", "Fira Code", "SF Mono", monospace !important;
    font-size: 14px !important;
}
.ace_gutter-active-line{
    background-color: var(--bg-medium) !important;
    color: var(--accent-blue) !important;
    border-left: 2px solid var(--accent-blue) !important;
}
`;

