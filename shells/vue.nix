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
      npm install --save-dev typescript
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
})
EOF
      npm install
      git init
    fi
  '';
}
