export type Position = [number, number];

type BoardCellProps = {
  value: number;
  col: number;
  row: number;
  setSelectedPosition: (pos: Position) => void;
  sudokuBoolInitial: boolean[][];
  selectedPosition: Position;
};

export function BoardCell({
  value,
  col,
  row,
  setSelectedPosition,
  sudokuBoolInitial,
  selectedPosition,
}: BoardCellProps) {
  const borderClassStyle = () => {
    let styleResult =
      "flex select-none cursor-pointer justify-center items-center text-2xl h-10 w-10 md:h-14 md:w-14 border border-slate-300";
    if (col === 0) {
      styleResult += " border-l-4";
    }
    if (col === 2 || col === 5 || col === 8) {
      styleResult += " border-r-4";
    }
    if (row === 0 || row === 3 || row === 6) {
      styleResult += " border-t-4";
    }
    if (row === 8) {
      styleResult += " border-b-4";
    }
    return styleResult;
  };

  const positionClick = () => {
    if (selectedPosition.length > 0) {
      document
        .getElementById(
          selectedPosition[0].toString() + selectedPosition[1].toString()
        )
        .classList.toggle("bg-sky-800");
    }
    document
      .getElementById(row.toString() + col.toString())
      .classList.toggle("bg-sky-800");
    let position = [row, col] as Position;
    console.log("Position", position);
    setSelectedPosition(position);
  };

  const renderCell = () => {
    if (sudokuBoolInitial[row][col]) {
      if (value === 0) {
        return <span className="">{""}</span>;
      } else {
        return <span>{value}</span>;
      }
    } else {
      return <span className="text-sky-500">{value}</span>;
    }
  };

  return (
    <div
      id={row.toString() + col.toString()}
      className={borderClassStyle()}
      onClick={positionClick}
    >
      {renderCell()}
    </div>
  );
}
