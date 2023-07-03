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
      npm install --save-dev @nuxtjs/tailwindcss
      cat > nuxt.config.ts << EOF
// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  typescript: {
    strict: true
  },
// https://nuxt.com/modules
  modules: [
    '@nuxtjs/tailwindcss'
  ],
  vite: {
    /* options for vite */
    // ssr: true // enable unstable server-side rendering for development (false by default)
    // experimentWarning: false // hide experimental warning message (disabled by default for tests)
    vue: {
      /* options for vite-plugin-vue2 */
    },
  }
  tailwindcss: {
      // Options
  }
})
EOF
      git init
    fi
  '';
}
