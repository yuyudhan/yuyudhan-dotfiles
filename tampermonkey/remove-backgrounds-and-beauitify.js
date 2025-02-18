// FilePath: tampermonkey/remove-backgrounds-and-beauitify.js

// ==UserScript==
// @name         Global Background Setter with GitHub Overrides (No Blur, Exclude Tridactyl, Preserve BG Images)
// @namespace    http://tampermonkey.net/
// @version      1.8
// @description  Set a custom background image on all webpages and remove background colors (set to transparent) on all common box-like elements—unless they already have a background image—while ignoring elements whose class starts with "tridactyl". Dynamically processes new elements using MutationObserver, using Tampermonkey
// @author       Ankur Pandey, with LLM Help
// @match        *://*/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    console.info("INFO: Global Background Setter (Preserve BG Images) script initialized.");

    // Inject CSS for html and body to set the global background image.
    const customCSS = `
        html, body {
            background: url('https://yuyudhan.github.io/yuyudhan-wallpapers/Parshuram/parshuram-9.jpg') no-repeat center center fixed !important;
            background-size: cover !important;
        }
    `;
    const styleElement = document.createElement('style');
    styleElement.type = 'text/css';
    styleElement.id = 'global-background-style';
    styleElement.appendChild(document.createTextNode(customCSS));
    document.head.appendChild(styleElement);
    console.info("INFO: Global background image CSS injected.");

    /**
     * Process an element: if it doesn't have a background image and doesn't belong
     * to an element whose class starts with "tridactyl", remove its background color.
     */
    function processElement(el) {
        if (el.nodeType !== Node.ELEMENT_NODE) return;

        const tag = el.tagName.toLowerCase();
        // Skip html and body
        if (tag === 'html' || tag === 'body') return;

        // Skip if element's classList contains any class starting with "tridactyl" (case-insensitive)
        if (Array.from(el.classList).some(cls => cls.toLowerCase().startsWith('tridactyl'))) return;

        // Check computed style for background-image
        const computed = window.getComputedStyle(el);
        if (!computed) return;
        // If no background image is set, remove background color by setting it to transparent.
        if (computed.backgroundImage === 'none' || computed.backgroundImage === 'initial' || computed.backgroundImage === 'unset') {
            el.style.backgroundColor = 'transparent';
        }
    }

    /**
     * Process an element and all its descendants.
     */
    function processSubtree(root) {
        processElement(root);
        root.querySelectorAll("*").forEach(child => processElement(child));
    }

    // Process all existing elements on the page
    processSubtree(document.body);
    console.info("INFO: Initial processing of document completed.");

    // Set up a MutationObserver to process dynamically added nodes.
    const observer = new MutationObserver(mutations => {
        mutations.forEach(mutation => {
            mutation.addedNodes.forEach(node => {
                processSubtree(node);
            });
        });
    });

    observer.observe(document.body, { childList: true, subtree: true });
    console.info("INFO: MutationObserver established to process dynamically added elements.");
})();

