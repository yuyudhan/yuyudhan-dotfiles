// FilePath: tampermonkey/remove-backgrounds-and-beauitify.js

// ==UserScript==
// @name         Global Background Cleaner with Size Filter (Exclude Tridactyl)
// @namespace    http://tampermonkey.net/
// @version      1.4
// @description  Set a custom background image on html/body and remove background colors only on large elements (width > 500px or height > 300px). Skips elements with a class starting with "tridactyl".
// @author       Ankur (@yuyudhan), ChatGPT, Claude
// @match        *://*/*
// @grant        none
// ==/UserScript==
(function() {
    'use strict';
    console.info("INFO: Global Background Cleaner script initialized.");

    // Set custom background on html/body
    const customBackgroundCSS = `
        html, body {
            background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)),
                        url('https://yuyudhan.github.io/yuyudhan-wallpapers/Parshuram/parshuram-9.jpg') no-repeat center center fixed !important;
            background-size: cover !important;
        }
    `;
    const styleElement = document.createElement('style');
    styleElement.type = 'text/css';
    styleElement.appendChild(document.createTextNode(customBackgroundCSS));
    document.head.appendChild(styleElement);
    console.debug("DEBUG: Custom background CSS injected.");

    // Target all potential block elements
    const selectors = "div, table, section, form, footer, header, nav, main, article, aside";

    // Check if element has a Tridactyl class
    function hasTridactylClass(el) {
        return Array.from(el.classList).some((cls) =>
            cls.toLowerCase().startsWith("tridactyl")
        );
    }

    // Check if element size meets criteria (width > 500px or height > 300px)
    function isLargeElement(el) {
        const rect = el.getBoundingClientRect();
        // return rect.width > 600 || rect.height > 400;
        return rect.width * rect.height > 600 * 400;
    }

    // Process an element - make transparent only if large enough
    function processElement(el) {
        // Skip elements with Tridactyl classes
        if (hasTridactylClass(el)) {
            return;
        }

        // Only process elements with display: block and sufficient size
        const compStyle = window.getComputedStyle(el);
        if (compStyle.display === 'block' || compStyle.display === 'flex' ||
            compStyle.display === 'grid' || compStyle.display === 'table') {

            // Check size - only make transparent if large enough
            if (isLargeElement(el)) {
                if (compStyle.backgroundImage === "none") {
                    el.style.setProperty("background", "transparent", "important");
                } else {
                    el.style.setProperty("background-color", "transparent", "important");
                }
            }
        }
    }

    // Process initial elements after a short delay to allow page to render
    setTimeout(() => {
        document.querySelectorAll(selectors).forEach(processElement);
        console.debug("DEBUG: Initial background cleaning applied to existing large elements.");
    }, 500);

    // Set up MutationObserver to handle dynamically added elements
    const observer = new MutationObserver((mutations) => {
        mutations.forEach((mutation) => {
            mutation.addedNodes.forEach((node) => {
                if (node.nodeType === Node.ELEMENT_NODE) {
                    if (node.matches(selectors)) {
                        processElement(node);
                    }
                    node.querySelectorAll(selectors).forEach(processElement);
                }
            });
        });
    });

    observer.observe(document.documentElement, { childList: true, subtree: true });
    console.info("INFO: MutationObserver is active. New large elements will be processed as they appear.");
})();

