// public/sa-bridge.js
(function (w, d) {
  'use strict';

  var BRIDGE = {};

  /* -------------------- utils -------------------- */
  function qsp() { return new URLSearchParams(w.location.search || ''); }

  function getTheme() {
    var qs = qsp();
    var fromQs = qs.get('theme');
    if (fromQs) return fromQs;
    try {
      return w.localStorage.getItem('ui.theme') ||
             w.sessionStorage.getItem('ui.theme') ||
             'light';
    } catch (e) {
      return 'light';
    }
  }

  function setThemeAttr(theme) {
    try {
      d.documentElement.setAttribute('data-theme', theme);
      w.localStorage.setItem('ui.theme', theme);
      w.sessionStorage.setItem('ui.theme', theme);
      d.cookie = 'ui_theme=' + encodeURIComponent(theme) + ';path=/;max-age=31536000';
    } catch (e) {}
  }

  function abs(path) {
    if (!path) return '/';
    if (/^https?:\/\//i.test(path)) return path;
    return path[0] === '/' ? path : '/' + path;
  }

  function getReturnTo(defaultUrl) {
    var qs = qsp();
    var fromQs = qs.get('returnTo');
    if (fromQs) return abs(fromQs);
    try {
      var s1 = w.sessionStorage.getItem('spa.returnTo');
      if (s1) return abs(s1);
      var s2 = w.localStorage.getItem('spa.returnTo');
      if (s2) return abs(s2);
    } catch (e) {}
    return abs(defaultUrl || '/home-consulta');
  }

  function buildUrl(path, extras) {
    var u = new URL(abs(path), w.location.origin);
    u.searchParams.set('theme', getTheme());
    var rt = extras && extras.returnTo ? extras.returnTo : getReturnTo();
    if (rt) u.searchParams.set('returnTo', abs(rt));
    if (extras) {
      for (var k in extras) {
        if (!Object.prototype.hasOwnProperty.call(extras, k)) continue;
        if (k === 'returnTo') continue; // já tratamos acima
        var v = extras[k];
        if (v === undefined || v === null) continue;
        var s = String(v);
        if (s.length) u.searchParams.set(k, s);
      }
    }
    return u.pathname + u.search;
  }

  /* -------------------- API pública -------------------- */
  BRIDGE.theme = getTheme;
  BRIDGE.applyTheme = function () { setThemeAttr(getTheme()); };
  BRIDGE.backUrl = function (fallback) { return getReturnTo(fallback); };
  BRIDGE.goBack = function (fallback) { w.location.assign(getReturnTo(fallback)); };

  BRIDGE.pushReturn = function (url) {
    try {
      var stack = JSON.parse(w.sessionStorage.getItem('spa.navStack') || '[]');
      stack.push(url);
      w.sessionStorage.setItem('spa.navStack', JSON.stringify(stack));
      w.sessionStorage.setItem('spa.returnTo', url);
      w.localStorage.setItem('spa.returnTo', url);
    } catch (e) {}
  };

  BRIDGE.open = function (path, extras) {
    var url = buildUrl(path, extras || null);
    w.location.assign(url);
  };

  // caminhos absolutos das calculadoras
  var CALC = {
    refin: '/calculadoras/refinanciamento/index.html',
    antecip: '/calculadoras/antecipacao/index.html',
    originais: '/calculadoras/parcelas-originais/index.html'
  };

  BRIDGE.openCalc = function (kind, extras) {
    var here = w.location.pathname + w.location.search; // voltar para a página atual
    var target = CALC[kind];
    if (!target) return;
    try { w.sessionStorage.setItem('nav.back', here); } catch (e) {}
    BRIDGE.open(target, Object.assign({}, extras || {}, { returnTo: here }));
  };

  BRIDGE.openAcordos = function (extras) {
    BRIDGE.open('/acordos/home/index.html', extras || null);
  };

  BRIDGE.initStaticPage = function (fallbackBack) {
    // aplica tema (já na carga)
    if (d.readyState === 'loading') {
      d.addEventListener('DOMContentLoaded', function () { setThemeAttr(getTheme()); });
    } else {
      setThemeAttr(getTheme());
    }

    // opcional: registra caminhos padrão
    try {
      w.localStorage.setItem('paths.acordos', '/acordos/home/index.html');
      w.localStorage.setItem('paths.refin', CALC.refin);
      w.localStorage.setItem('paths.antecip', CALC.antecip);
      w.localStorage.setItem('paths.originais', CALC.originais);
    } catch (e) {}

    // amarra botões "Voltar"
    var bindBack = function () {
      var btn = d.querySelector('[data-sa-action="back"], #btnVoltar');
      if (btn && !btn.__sa_bound) {
        btn.__sa_bound = true;
        btn.addEventListener('click', function (ev) {
          ev.preventDefault();
          BRIDGE.goBack(fallbackBack);
        });
      }
    };
    bindBack();
    setTimeout(bindBack, 0);
    setTimeout(bindBack, 300);
  };

  // exporta no escopo global
  w.saBridge = BRIDGE;
})(window, document);
