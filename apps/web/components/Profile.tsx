import { ConnectKitButton } from "connectkit";
import Image from "next/image";
import {
  useAccount,
  // useConnect,
  useDisconnect,
  useEnsAvatar,
  useEnsName,
} from "wagmi";

export function Profile() {
  const { address, connector, isConnected } = useAccount();
  const { data: ensName } = useEnsName({ address });
  const { data: ensAvatar } = useEnsAvatar({ name: ensName });
  // const { connect, connectors, error, isLoading, pendingConnector } =
  //   useConnect();
  const { disconnect } = useDisconnect();

  if (isConnected) {
    return (
      <div>
        <Image src={ensAvatar || ""} alt="ENS Avatar" />
        <div>{ensName ? `${ensName} (${address})` : address}</div>
        <div>Connected to {connector?.name || address}</div>
        <button onClick={() => disconnect()}>Disconnect</button>
      </div>
    );
  }

  return (
    <ConnectKitButton showAvatar showBalance />
    // <div>
    //   {connectors.map((connector) => (
    //     <button
    //       disabled={!connector.ready}
    //       key={connector.id}
    //       onClick={() => connect({ connector })}
    //     >
    //       {connector.name}
    //       {!connector.ready && " (unsupported)"}
    //       {isLoading &&
    //         connector.id === pendingConnector?.id &&
    //         " (connecting)"}
    //     </button>
    //   ))}

    //   {error && <div>{error.message}</div>}
    // </div>
  );
}
