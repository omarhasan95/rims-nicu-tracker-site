(function () {
  try {
    var key = 'nicu_supabase_config_v1';
    var current = {};
    try { current = JSON.parse(localStorage.getItem(key) || '{}') || {}; } catch (e) {}
    if (!current.url || !current.anonKey) {
      localStorage.setItem(key, JSON.stringify({
        url: 'https://hxuqgsjnzobzgmkhculb.supabase.co',
        anonKey: 'sb_publishable_y4asO4TJ6nfpLsf-ySuihA_duDHyb_X'
      }));
    }
  } catch (e) {}
})();
