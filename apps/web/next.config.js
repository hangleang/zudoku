/** @type {import('next').NextConfig} */
module.exports = {
  transpilePackages: ["@repo/ui"],
  reactStrictMode: true,
  webpack: function (config, options) {
    if (!options.isServer) {
      config.resolve.fallback = { fs: false, net: false, tls: false };
    }
    // config.experiments = { asyncWebAssembly: true };
    return config;
  },
};
