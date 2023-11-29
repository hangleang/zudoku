import { Position, BoardCell } from "./BoardCell";

type MainBoardProps = {
  sudoku: number[][];
  setSelectedPosition: (pos: Position) => void;
  sudokuBoolInitial: boolean[][];
  selectedPosition: Position;
};

export function MainBoard({
  sudoku,
  setSelectedPosition,
  sudokuBoolInitial,
  selectedPosition,
}: MainBoardProps) {
  return (
    <>
      {sudoku.map((row, i) => {
        return (
          <div className="grid grid-cols-9" key={i}>
            {row.map((col, j) => {
              return (
                <BoardCell
                  value={col}
                  col={j}
                  row={i}
                  setSelectedPosition={setSelectedPosition}
                  sudokuBoolInitial={sudokuBoolInitial}
                  selectedPosition={selectedPosition}
                  key={j}
                />
              );
            })}
          </div>
        );
      })}
    </>
  );
}
