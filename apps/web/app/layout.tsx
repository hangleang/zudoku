import "./globals.css";
import type { Metadata } from "next";
import { Inter } from "next/font/google";
import { Header } from "../components/Header";
import { Footer } from "../components/Footer";

// config
import { WagmiConfig, createConfig } from "wagmi";
import { configureChains } from "@wagmi/core";
import { sepolia } from "@wagmi/core/chains";

// providers
import { publicProvider } from "@wagmi/core/providers/public";
import { infuraProvider } from "@wagmi/core/providers/infura";

// chains & connectors
// import {  } from "@wagmi/core/chains";
import { ConnectKitProvider, getDefaultConfig } from "connectkit";

const INFURA_API_KEY = process.env.API_KEY_INFURA;
// eslint-disable-next-line turbo/no-undeclared-env-vars
const WC_PROJECT_ID = process.env.WALLETCONNECT_PROJECT_ID || "";

const { chains, publicClient, webSocketPublicClient } = configureChains(
  [sepolia],
  [
    INFURA_API_KEY
      ? infuraProvider({ apiKey: INFURA_API_KEY })
      : publicProvider(),
  ]
);

// const config = createConfig({
//   autoConnect: true,
//   publicClient,
//   webSocketPublicClient,
//   connectors: [
//     new MetaMaskConnector({ chains }),
//     new CoinbaseWalletConnector({
//       chains,
//       options: {
//         appName: "wagmi",
//       },
//     }),
//     new WalletConnectConnector({
//       chains,
//       options: {
//         projectId: "...",
//       },
//     }),
//     new InjectedConnector({
//       chains,
//       options: {
//         name: "Injected",
//         shimDisconnect: true,
//       },
//     }),
//   ],
// });

const config = createConfig(
  getDefaultConfig({
    autoConnect: true,
    chains,
    publicClient,
    webSocketPublicClient,

    // Required API Keys
    infuraId: INFURA_API_KEY, // or infuraId
    walletConnectProjectId: WC_PROJECT_ID,

    // Required
    appName: "Your App Name",

    // Optional
    appDescription: "Your App Description",
    appUrl: "https://family.co", // your app's url
    appIcon: "https://family.co/logo.png", // your app's icon, no bigger than 1024x1024px (max. 1MB)
  })
);

const inter = Inter({ subsets: ["latin"] });

const URL = "https://zk-sudoku.vercel.app";

export const metadata: Metadata = {
  title: "zkSudoku",
  description: "Zero Knowledge Sudoku Game",
  icons: "/favicon.ico",
  twitter: {
    title: "zkSudoku",
    description: "Zero Knowledge Sudoku Game",
    card: "summary_large_image",
    site: URL,
    images: `${URL}/socialMedia.png`,
  },
  openGraph: {
    type: "website",
    title: "zkSudoku",
    description: "Zero Knowledge Sudoku Game",
    url: URL,
    images: `${URL}/socialMedia.png`,
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <WagmiConfig config={config}>
      <ConnectKitProvider>
        <div className="flex flex-col min-h-screen px-2 bg-slate-900 text-slate-300">
          <Header />
          <main className={`mb-auto ${inter.className}`}>{children}</main>
          <Footer />
        </div>
      </ConnectKitProvider>
    </WagmiConfig>
  );
}
