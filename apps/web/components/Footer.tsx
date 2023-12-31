import { SourceCodeView } from "./SourceCodeView";
import Link from "next/link";

export function Footer() {
  return (
    <footer className="mt-20 mb-5 flex items-center justify-center space-x-5">
      <div>
        <Link href="/about">
          <a className="text-sky-300 hover:underline">About</a>
        </Link>
      </div>
      <div>&#8226;</div>
      <div>
        <SourceCodeView />
      </div>
    </footer>
  );
}
