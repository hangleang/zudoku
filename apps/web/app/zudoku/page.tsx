import { MainBoard } from "../../components/MainBoard";
import { Position } from "../../components/BoardCell";
import React, { useEffect, useState } from "react";
import { KeyPad } from "../../components/KeyPad";
import Head from "next/head";
import { BackButton } from "../../components/BackButton";
import styles from "../styles/Sudoku.module.css";
import { useAccount, useNetwork } from "wagmi";

import { sudokuCalldata } from "../../utils/snarkSudoku";

import { sudokuRead, sudokuWrite } from "../../configs/contract";
import { Metadata } from "next";

let sudokuBoolInitialTemp = [
  [false, false, false, false, false, false, false, false, false],
  [false, false, false, false, false, false, false, false, false],
  [false, false, false, false, false, false, false, false, false],
  [false, false, false, false, false, false, false, false, false],
  [false, false, false, false, false, false, false, false, false],
  [false, false, false, false, false, false, false, false, false],
  [false, false, false, false, false, false, false, false, false],
  [false, false, false, false, false, false, false, false, false],
  [false, false, false, false, false, false, false, false, false],
];

export const metadata: Metadata = {
  title: "Zudoku Game",
};

export default function Sudoku() {
  const [sudokuInitial, setSudokuInitial] = useState([]);
  const [sudoku, setSudoku] = useState<number[][]>([]);
  const [sudokuBoolInitial, setSudokuBoolInitial] = useState<boolean[][]>(
    sudokuBoolInitialTemp
  );
  const [selectedPosition, setSelectedPosition] = useState<Position>([0, 0]);

  const dataAccount = useAccount();
  const { chain } = useNetwork();

  const [loadingVerifyBtn, setLoadingVerifyBtn] = useState(false);
  const [loadingStartGameBtn, setLoadingStartGameBtn] = useState(false);

  const updatePosition = (num: number) => {
    if (selectedPosition.length > 0) {
      if (!sudokuBoolInitial[selectedPosition[0]][selectedPosition[1]]) return;
      const temp = [...sudoku];
      temp[selectedPosition[0]][selectedPosition[1]] = num;
      setSudoku(temp);
      console.log("sudoku", sudoku);
    }
  };

  const calculateProof = async () => {
    setLoadingVerifyBtn(true);
    console.log("sudokuInitial", sudokuInitial);
    console.log("sudoku", sudoku);
    let calldata = await sudokuCalldata(sudokuInitial, sudoku);

    if (!calldata) {
      setLoadingVerifyBtn(false);
      return "Invalid inputs to generate witness.";
    }

    // console.log("calldata", calldata);

    try {
      let result = await sudokuRead("verifySudoku", [
        calldata.a,
        calldata.b,
        calldata.c,
        calldata.Input,
      ]);
      console.log("result", result);
      setLoadingVerifyBtn(false);
      alert("Successfully verified");
    } catch (error) {
      setLoadingVerifyBtn(false);
      console.log(error);
      alert("Wrong solution");
    }
  };

  const verifySudoku = async () => {
    console.log("Address", dataAccount?.address);
    calculateProof();
  };

  const renderVerifySudoku = () => {
    return (
      <button
        className="flex justify-center items-center disabled:cursor-not-allowed space-x-3 verify-btn text-lg font-medium rounded-md px-5 py-3 w-full bg-gradient-to-r from-sky-600 to-emerald-600 hover:from-sky-500 hover:to-emerald-500"
        onClick={verifySudoku}
        disabled={loadingVerifyBtn}
      >
        {loadingVerifyBtn && <div className={styles.loader}></div>}
        <span>Verify Sudoku</span>
      </button>
    );
  };

  const initializeBoard = async () => {
    try {
      let board;

      if (dataAccount?.address && chain?.id.toString()) {
        board = await sudokuWrite("generateSudokuBoard", [
          new Date().toString(),
        ]);
      } else {
        board = await sudokuRead("generateSudokuBoard", [
          new Date().toString(),
        ]);
      }

      console.log("result", board);

      setSudokuInitial(board);

      let newArray = board.map((arr: any) => {
        return arr.slice();
      });
      setSudoku(newArray);

      const temp = [
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
      ];
      for (let i = 0; i < board.length; i++) {
        for (let j = 0; j < board.length; j++) {
          if (board[i][j] === 0) {
            temp[i][j] = true;
          }
        }
      }
      setSudokuBoolInitial(temp);
    } catch (error) {
      alert("Failed fetching Sudoku board");
    }
  };

  const renderNewGame = () => {
    return (
      <button
        className="flex justify-center items-center disabled:cursor-not-allowed space-x-3 verify-btn text-lg font-medium rounded-md px-5 py-3 w-full bg-gradient-to-r from-sky-600 to-emerald-600 hover:from-sky-500 hover:to-emerald-500"
        onClick={async () => {
          setLoadingStartGameBtn(true);
          await initializeBoard();
          setLoadingStartGameBtn(false);
        }}
        disabled={loadingStartGameBtn}
      >
        {loadingStartGameBtn && <div className={styles.loader}></div>}
        <span>New Game</span>
      </button>
    );
  };

  const renderSudoku = () => {
    if (sudoku.length !== 0) {
      return (
        <>
          <div>
            <MainBoard
              sudoku={sudoku}
              setSelectedPosition={(pos) => setSelectedPosition(pos)}
              selectedPosition={selectedPosition}
              sudokuBoolInitial={sudokuBoolInitial}
            />
          </div>
          <div>
            <div className="flex justify-center items-center my-10">
              {renderNewGame()}
            </div>
            <KeyPad updatePosition={updatePosition} />
            <div className="flex justify-center items-center my-10">
              {renderVerifySudoku()}
            </div>
          </div>
        </>
      );
    } else {
      return (
        <div className="flex justify-center items-center space-x-3">
          <div className={styles.loader}></div>
          <div>Loading Game</div>
        </div>
      );
    }
  };

  useEffect(() => {
    console.log("Sudoku page");

    initializeBoard();
  }, []);
  return (
    <div>
      <Head>
        <title>zkSudoku</title>
        <meta name="title" content="zkSudoku" />
        <meta name="description" content="Zero Knowledge Sudoku Games" />
      </Head>
      <div className="mb-10">
        <BackButton />
      </div>
      <div className="flex">
        <div className="mx-5 mb-10 text-3xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-sky-500 to-emerald-500 ">
          Sudoku
        </div>
      </div>
      <div className="flex flex-wrap gap-20 justify-center items-center text-slate-300">
        {renderSudoku()}
      </div>
      <div className="flex place-content-center mt-20 text-lg text-slate-300">
        <div className="md:w-6/12">
          <div className="text-center my-5 font-semibold">Sudoku rules:</div>
          <div className="space-y-5">
            <p>
              <span className="font-semibold">Sudoku</span> (also known as
              &quot;Number Place&quot;) is a placement puzzle. The puzzle is
              most frequently a 9 x 9 grid made up of 3 x 3 subgrids (called
              &quot;regions&quot;). Some cells already contain numbers, known as
              &quot;givens&quot;.
            </p>
            <ul className="list-disc space-y-2 pl-5">
              <li>
                The goal is to fill in the empty cells, one number in each, so
                that each column, row, and region contains the numbers 1 through
                9 exactly once.
              </li>
              <li>
                Each number in the solution therefore occurs only once in each
                of three &quot;directions&quot;, hence the &quot;single
                numbers&quot; implied by the puzzle&apos;s name.
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  );
}
