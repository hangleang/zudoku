import Link from "next/link";
import { ConnectKitButton } from "connectkit";

export function Header() {
  return (
    <header className="flex flex-wrap justify-between p-5 mb-5">
      <Link href="/">
        <a className="text-xl md:mb-auto mb-5 font-bold text-transparent bg-clip-text bg-gradient-to-r from-sky-500 to-emerald-500 ">
          zkSudoku
        </a>
      </Link>

      <ConnectKitButton showAvatar showBalance />
    </header>
  );
}
