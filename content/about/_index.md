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

-----
{{< raw_html >}}
<br>
{{< /raw_html >}}

## Education

{{< raw_html >}}
<div class="education-section">
  <div class="education-item">
    <div class="education-time">2023–Present</div>
    <div class="education-details">
      <h4>Stockholm University / KTH Royal Institute of Technology</h4>
      <p>Master’s degree in Mathematics</p>
    </div>
  </div>
  <div class="education-item">
    <div class="education-time">2019–2023</div>
    <div class="education-details">
      <h4>Petrozavodsk State University</h4>
      <p>Bachelor’s degree in Mathematics</p>
    </div>
  </div>
</div>
{{< /raw_html >}}

## Thesis

{{< raw_html >}}
<div class="thesis-section">
  <div class="thesis-grid">
    <div class="thesis-card">
      <div class="thesis-card-accent"></div>
      <div class="thesis-card-body">
        <div>
          <span class="thesis-badge badge-master">Master thesis · 2026</span>
        </div>
        <p class="thesis-title">"Berry Phase for Quantum Graphs"</p>
        <p class="thesis-supervisor">
          <i class="ti ti-user" aria-hidden="true"></i>
          Pavel Kurasov
        </p>
        <div class="thesis-divider"></div>
        <div>
          <p class="contrib-label">Contributions</p>
          <ul class="contrib-list">
            <li>Studied <em>topology change</em> via parameter-dependent vertex conditions</li>
            <li>Derived explicit continuous eigenfunction families</li>
            <li>Showed topology change induces a nontrivial <em>Berry phase π</em> for real-valued eigenfunctions</li>
            <li>Established connection between topology change and operator domain structure</li>
          </ul>
        </div>
      </div>
      <div class="thesis-footer">
        {{<link rellink="texts/masters.pdf" class="thesis-link" caption="Read thesis">}}
        <span class="thesis-year">Stockholm University</span>
      </div>
    </div>
    <div class="thesis-card">
      <div class="thesis-card-accent bachelor"></div>
      <div class="thesis-card-body">
        <div>
          <span class="thesis-badge badge-bachelor">Bachelor thesis · 2023</span>
        </div>
        <p class="thesis-title">"Bernstein Polynomials and MacWilliams Transform"</p>
        <p class="thesis-supervisor">
          <i class="ti ti-users" aria-hidden="true"></i>
          Nikita Gogin, Vladimir Kuznetsov
        </p>
        <div class="thesis-divider"></div>
        <div>
          <p class="contrib-label">Contributions</p>
          <ul class="contrib-list">
            <li>Studied <em>MacWilliams (Krawtchouk)</em> transform and applications in approximation theory</li>
            <li>Found new formulae for <em>Bernstein</em> and <em>Chebyshev</em> polynomials</li>
            <li>Developed an algorithm for computing Bernstein polynomials</li>
          </ul>
        </div>
      </div>
      <div class="thesis-footer">
        {{<link rellink="texts/bachelors.pdf" class="thesis-link" caption="Read thesis (RU)">}}
        <span class="thesis-year">Petrozavodsk State University</span>
      </div>
    </div>

  </div>
</div>
{{< /raw_html >}}

## Publications
### Preprints

{{< raw_html >}}
<div class="pub-list">
  <div class="pub-item">
    <span class="pub-number">1.</span>
    <span class="pub-authors">Pavel Kurasov, Vladislav Shubin, Axel Tibbling.</span> 
    <span class="pub-title">"Berry's phase under topology change"</span>. 
    <span class="pub-meta">
      <a class="pub-link" href="https://doi.org/10.48550/arXiv.2605.10798" target="_blank">arXiv:2605.10798</a> • 2026
    </span>
  </div>
</div>
<br>
{{< /raw_html >}}

### Conference Publications

{{< raw_html >}}
<div class="pub-list">
  <div class="pub-item">
    <span class="pub-number">1.</span>
    <span class="pub-authors">Vladislav Shubin and Ivan Ushakov.</span> 
    <a class="pub-link pub-title" href="https://pca.conf-pdmi.ru/2026/files/53/PCA2026_Abstract.pdf" target="_blank">"MacWilliams Transform with Binomial Weights"</a>. 
    <span class="pub-venue">Polynomial Computer Algebra</span>, <span class="pub-meta">Saint-Petersburg, Russia • 2026</span>
  </div>

  <div class="pub-item">
    <span class="pub-number">2.</span>
    <span class="pub-authors">Vladislav Shubin and Nikita Gogin.</span> 
    <a class="pub-link pub-title" href="https://pca.conf-pdmi.ru/2025/files/63/GoginShubin.pdf" target="_blank">“Prime Power Conjecture for Projective Planes”</a>. 
    <span class="pub-venue">International Conference Polynomial Computer Algebra ’2025’ (PCA’2025)</span>, <span class="pub-meta">Saint-Petersburg, Russia • 2025</span>
  </div>
  
  <div class="pub-item">
    <span class="pub-number">3.</span>
    <span class="pub-authors">Vladislav Shubin and Nikita Gogin.</span> 
    <a class="pub-link pub-title" href="https://pca-pdmi.ru/2024/files/48/prime.pdf" target="_blank">“Binomial Coefficients as Functions of their Denominator; Another Primality Criteria for Natural Integers”</a>. 
    <span class="pub-venue">International Conference Polynomial Computer Algebra ’2024’ (PCA’2024)</span>, <span class="pub-meta">Saint-Petersburg, Russia • 2024</span>
  </div>

  <div class="pub-item">
    <span class="pub-number">4.</span>
    <span class="pub-authors">Vladislav Shubin and Nikita Gogin.</span> 
    <a class="pub-link pub-title" href="https://pca-pdmi.ru/2023/files/17/Gogin-Shubin-2023.pdf" target="_blank">“Bernstein Polynomials and MacWilliams transform”</a>. 
    <span class="pub-venue">International Conference Polynomial Computer Algebra ’2023’ (PCA’2023)</span>, <span class="pub-meta">Saint-Petersburg, Russia • 2023</span>
  </div>

  <div class="pub-item">
    <span class="pub-number">5.</span>
    <span class="pub-authors">Vladislav Shubin.</span> 
    <a class="pub-link pub-title" href="" target="_blank">“Study of ϕ-radical numbers”</a>. 
    <span class="pub-venue">73rd Scientific Conference of Sudents and Young Scientists</span>, <span class="pub-meta">Petrozavodsk, Russia • 2021</span>
  </div>
{{< /raw_html >}}

### OEIS Contributions

### Authored Sequences

* **[A355045](https://oeis.org/A355045)** — Least multiple \\(k\\) of \\(p_n\\) such that the Dedekind \\(\psi(k)\\) is a power of \\(\text{rad}(k)\\).
* **[A355059](https://oeis.org/A355059)** — The exponents \\(m\\) satisfying \\(\psi(k) = \text{rad}(k)^m\\) for the terms in A355045.
* **[A337775](https://oeis.org/A337775)** — Least multiple \\(k\\) of \\(p_n\\) such that the Euler \\(\phi(k)\\) is a power of \\(\text{rad}(k)\\).
* **[A337776](https://oeis.org/A337776)** — The exponents \\(m\\) satisfying \\(\phi(k) = \text{rad}(k)^m\\) for the terms in A337775.

### Editorial Contributions

* **[A000108](https://oeis.org/A000108)** (Catalan Numbers) — Proved an identity linking terms to a specific index of Krawtchouk polynomials: \\(a(n) = \mathcal{K}^{(2n+1, n, 1)}\\).
