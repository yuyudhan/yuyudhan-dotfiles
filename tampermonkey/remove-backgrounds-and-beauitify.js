
// FilePath: tampermonkey/remove-backgrounds-and-beauitify.js
// ==UserScript==
// @name         Global Background Cleaner on All Pages (Exclude Tridactyl)
// @namespace    http://tampermonkey.net/
// @version      1.3
// @description  Set a custom background image on html/body and remove background colors on other elements – preserving any background images. Skips elements with a class starting with "tridactyl". Uses a MutationObserver to catch future elements.
// @author       Ankur (@yuyudhan), ChatGPT
// @match        *://*/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    console.info("INFO: Global Background Cleaner script initialized.");

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

    const selectors = "div, table, td, th, a, tr, c-wiz, nav, ul, ol, section, span, input, textarea";

    function hasTridactylClass(el) {
        return Array.from(el.classList).some((cls) =>
            cls.toLowerCase().startsWith("tridactyl")
        );
    }

    function processElement(el) {
        if (hasTridactylClass(el)) {
            return;
        }
        const compStyle = window.getComputedStyle(el);
        if (compStyle.backgroundImage === "none") {
            el.style.setProperty("background", "transparent", "important");
        } else {
            el.style.setProperty("background-color", "transparent", "important");
        }
    }

    document.querySelectorAll(selectors).forEach(processElement);
    console.debug("DEBUG: Initial background cleaning applied to existing elements.");

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
    console.info("INFO: MutationObserver is active. New elements will be processed as they appear.");
})();

