---
title: "About Me"
layout: "about"
---

# About

I am a Master’s student in mathematics at Stockholm University, working in spectral theory and quantum graphs, with a particular interest in the interaction between topology and operator theory.

My publications of any kind can be found {{<link rellink="texts" caption="here">}}.

## Interests

### Quantum Graphs and Topology Change

As a Master’s student, I worked under the supervision of [Pavel Kurasov](https://staff.math.su.se/kurasov/). The result of this work is my master thesis “Berry's Phase for Quantum Graphs”.

In my Master’s thesis, I studied topology change on a figure-eight metric graph via parameter-dependent vertex conditions. The goal was to understand how changes in connectivity affect spectral properties of the Laplacian.

In particular, we showed that a full cycle of topology change induces a nontrivial Berry phase \\(\pi\\) for real-valued eigenfunctions. This demonstrates a direct link between topology change and geometric phase in quantum graph models.

{{<img caption="Figure-eight graph" alt="Figure-eight graph" class="main__image" src="figure_eight.svg">}}

The model is based on the condition
\\[
    i (S_{\theta} - I) \overrightarrow{\psi} = (S_{\theta} + I) \partial \overrightarrow{\psi}. 
\\]

This induces topology change, illustrated below.

{{<img caption="Topology Change" alt="Topology Change" class="main__image" src="topology_change.svg">}}

As a result, we obtain a Berry phase
\\[
    \psi^{(2 \pi)} = e^{i \pi} \psi^{(0)}.
\\]

This suggests that topology change in quantum graphs has observable geometric effects and may be relevant for models of quantum systems with varying connectivity.

### Coding Theory and Krawtchouk Polynomials

During my Bachelor's studies, I worked under supervision of [Nikita Gogin](https://www.mathnet.ru/php/person.phtml?option_lang=eng&personid=45587) on Krawtchouk matrices which were used in several interesting applications.
{{<img caption="Krawtchouk matrix of order 321 modulo 23" alt="Krawtchouk matrix of order 321 modulo 32" class="main__image" src="km-o321m23Gogin.png">}}

#### Live Preview of Krawtchouk Matrices:

{{< raw_html >}}

<button id="toggle-viewer-btn" class="matrix-btn toggle-btn" onclick="toggleViewer()">Show Preview</button>

<div id="matrix-viewer-content" class="matrix-viewer-container" style="display: none;">
    <div class="controls">
        <div class="control-group">
            <label>Select Modulo:</label>
            <button class="matrix-btn active" data-mod="23" data-max="252" onclick="setModulo(23, this)">Mod 23</button>
            <button class="matrix-btn" data-mod="19" data-max="208" onclick="setModulo(19, this)">Mod 19</button>
            <button class="matrix-btn" data-mod="7" data-max="76" onclick="setModulo(7, this)">Mod 7</button>
        </div>

<div class="control-group">
            <label>Order: <span id="order-val" style="display:inline-block; min-width: 3ch; text-align: right;">1</span></label>
            <button class="matrix-btn"
                onmousedown="startStep(-1)" onmouseup="stopStep()" onmouseleave="stopStep()"
                ontouchstart="startStep(-1)" ontouchend="stopStep()">−</button>
            <input type="range" id="order-slider" min="1" max="252" step="1" value="1" oninput="setOrder(this.value)">
            <button class="matrix-btn"
                onmousedown="startStep(1)" onmouseup="stopStep()" onmouseleave="stopStep()"
                ontouchstart="startStep(1)" ontouchend="stopStep()">+</button>
        </div>
    </div>

<div class="display-panel">
        <div class="image-frame">
            <img id="matrix-display" src="preview/km-o321m23Gogin.png" alt="Krawtchouk Matrix Viewer">
        </div>
        <div class="info" id="matrix-info">km-o321m31.png</div>
    </div>
</div>

<style>
</style>

<script>
    let currentModulo = 23;
    let currentOrder = 1;
    let debounceTimer = null;
    let stepInterval = null;

    function toggleViewer() {
        const viewer = document.getElementById('matrix-viewer-content');
        const btn = document.getElementById('toggle-viewer-btn');
        if (viewer.style.display === "none") {
            viewer.style.display = "block";
            btn.innerText = "Hide Preview";
            btn.classList.add('active');
        } else {
            viewer.style.display = "none";
            btn.innerText = "Show Preview";
            btn.classList.remove('active');
        }
    }

    function updateMatrixImage() {
        const filename = `preview/km-o${currentOrder}m${currentModulo}Gogin.png`;
        document.getElementById('matrix-display').src = filename;
        document.getElementById('matrix-info').innerText = filename.replace('preview/', '');
    }

    function setModulo(mod, btn) {
        currentModulo = mod;
        btn.parentNode.querySelectorAll('.matrix-btn').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        const maxLimit = parseInt(btn.getAttribute('data-max'), 10);
        const slider = document.getElementById('order-slider');
        slider.max = maxLimit;
        if (currentOrder > maxLimit) {
            currentOrder = maxLimit;
            slider.value = maxLimit;
            document.getElementById('order-val').innerText = maxLimit;
        }
        updateMatrixImage();
    }

    function setOrder(val) {
        currentOrder = parseInt(val);
        document.getElementById('order-val').innerText = currentOrder;
        clearTimeout(debounceTimer);
        debounceTimer = setTimeout(updateMatrixImage, 30);
    }

    function stepOrder(delta) {
        const slider = document.getElementById('order-slider');
        const newVal = Math.min(Math.max(1, parseInt(currentOrder) + delta), parseInt(slider.max));
        slider.value = newVal;
        setOrder(newVal);
    }

    function startStep(delta) {
        stopStep();
        stepOrder(delta);
        stepInterval = setInterval(() => stepOrder(delta), 80);
    }

    function stopStep() {
        clearInterval(stepInterval);
        stepInterval = null;
    }

    document.addEventListener("DOMContentLoaded", function() {
        updateMatrixImage();
    });
</script>
{{< /raw_html >}}

One of the applications was the derivation of new formulae for Bernstein and Chebyshev polynomials. Also we developed an algorithm for computing Bernstein polynomials.

Also, we studied connections of discrete functions, Krawtchouk polynomials, finite geometries, and primality.

I have two repositories on Github related to this mathematical object: [MWViewer](https://github.com/supxinfy/MWViewer) (which I used on [PCA2023](https://pca-pdmi.ru/2023/)), [krview](https://github.com/supxinfy/krview) (small program in Zig I made for fun).

In addition, I’m a [contributor](#oeis-contributions) to the OEIS (Online Encyclopedia of Integer Sequences).

Most of my contributions are involved with the de Koninck problem which is an unsolved problem in number theory.

You can find my resume {{<link rellink="cv/cv.pdf" caption="here">}}.

## Education

- (2023-Present) [Stockholm University](https://www.su.se) / [KTH Royal Institute of Technology](https://www.kth.se), master's degree in mathematics.
- (2019-2023) [Petrozavodsk State University](http://petrsu.ru), bachelor's degree in Mathematics.

## Thesis

#### Master Thesis: "Berry Phase for Quantum Graphs"
Text is available {{<link rellink="texts/masters.pdf" caption="here">}}.
- Supervisor: *Pavel Kurasov*
#### Contributions:
- Studied _topology change_ via parameter-dependent vertex conditions.
- Derived explicit continuous eigenfunction families.
- Showed that topology change induces _a nontrivial Berry phase $pi$_ for real-valued eigenfunctions.
- Established a connection between topology change and the structure of operator domains.

#### Bachelor Thesis: "Bernstein Polynomials and MacWilliams Transform"
Text is available {{<link rellink="texts/bachelors.pdf" caption="here">}} (in Russian.)
- Supervisor: *Nikita Gogin*, *Vladimir Kuznetsov*
#### Contributions:
- Studied MacWilliams (Krawtchouk) transform and its applications in approximation theory. 
- Found new formulae for Bernstein and Chebyshev polynomials.
- Developed an algorithm for computing Bernstein polynomials.


## Publications

### Preprints

1. Pavel Kurasov, Vladislav Shubin, Axel Tibbling. "Berry's phase under topology change". doi: [https://doi.org/10.48550/arXiv.2605.10798](https://doi.org/10.48550/arXiv.2605.10798)


### Conference Publications

1. Vladislav Shubin. “Investigation of ϕ-radical numbers”. In: *73rd Scientific Conference of Sudents and Young Scientist. Petrozavodsk*, Russia, 2021. 

2. Vladislav Shubin and Nikita Gogin. [“Bernstein Polynomials and MacWilliams transform”](https://pca-pdmi.ru/2023/files/17/Gogin-Shubin-2023.pdf). In: *International Conference Polynomial Computer Algebra* ’2023’ (PCA’2023). Saint-Petersburg, Russia, 2023. 

3. Vladislav Shubin and Nikita Gogin. [“Binomial Coefficients as Functions of their Denominator; Another Primality Criteria for Natural Integers”](https://pca-pdmi.ru/2024/files/48/prime.pdf). In: *International Conference Polynomial Computer Algebra* ’2024’ (PCA’2024). Saint-Petersburg, Russia, 2024. 

4. Vladislav Shubin and Nikita Gogin. [“Prime Power Conjecture for Projective Planes”](https://pca.conf-pdmi.ru/2025/files/63/GoginShubin.pdf). In: *International Conference Polynomial Computer Algebra* ’2025’ (PCA’2025). Saint-Petersburg, Russia, 2025. 

5. Vladislav Shubin and Ivan Ushakov. ["MacWilliams Transform with Binomial Weights"](https://pca.conf-pdmi.ru/2026/files/53/PCA2026_Abstract.pdf). Polynomial Computer Algebra, 2026.

### OEIS contributions 

I authored the following OEIS sequences: 
[A355045](https://oeis.org/A355045), [A355059](https://oeis.org/A355059), [A337775](https://oeis.org/A337775), [A337776](https://oeis.org/A337776).

and also contributed to:
[A000108](https://oeis.org/A000108)
