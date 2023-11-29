import Head from "next/head";
import BackButton from "../../components/BackButton";
import { Metadata } from "next";

export const metadata: Metadata = {
  title: "About Zudoku",
};

export default function About() {
  return (
    <div>
      <Head>
        <title>Zudoku - About</title>
        <meta name="title" content="zudoku - About" />
        <meta name="description" content="Zero Knowledge Sudoku Game - About" />
      </Head>
      <div className="mb-10">
        <BackButton />
      </div>
      <div className="grid place-items-center">
        <div className="flex justify-center items-center mb-10 text-4xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-sky-500 to-emerald-500">
          Zudoku
        </div>
        <div className="flex justify-center items-center text-lg md:w-96 w-auto text-slate-300">
          Zudoku is a platform that allows users to play zk (zero knowledge)
          Sudoku games.
        </div>
      </div>
    </div>
  );
}
