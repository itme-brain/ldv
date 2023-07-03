{ pkgs ? import <nixpkgs> {} }:

# Add more packages to this shell.
# https://search.nixos.org/packages

with pkgs;
mkShell {
  nativeBuildInputs = [
    nodejs
    nodePackages.vue-cli
  ];
  shellHook = ''
    if [ ! -f nuxt.config.ts ]; then
      npx nuxi@latest init nuxt-app
      mv nuxt-app/* .
      rm -rf nuxt-app
      npm i -D nuxt-vite
      cat > nuxt.config.ts << EOF
// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  typescript: {
    strict: true
  },
  modules: [
    'nuxt-vite'
  ],
  vite: {
    /* options for vite */
    // ssr: true // enable unstable server-side rendering for development (false by default)
    // experimentWarning: false // hide experimental warning message (disabled by default for tests)
    vue: {
      /* options for vite-plugin-vue2 */
    },
  }
})
EOF
      npm install typescript --save-dev
      cat > tailwind.config.js << EOF
module.exports = {
  theme: {},
  plugins: [],
  content: [
    "./components/**/*.{vue,js,ts}",
    "./layouts/**/*.vue",
    "./pages/**/*.vue",
    "./composables/**/*.{js,ts}",
    "./plugins/**/*.{js,ts}",
    "./utils/**/*.{js,ts}",
    "./App.{js,ts,vue}",
    "./app.{js,ts,vue}",
    "./Error.{js,ts,vue}",
    "./error.{js,ts,vue}",
    "./app.config.{js,ts}"
  ]
}
EOF
    fi
  '';
}
