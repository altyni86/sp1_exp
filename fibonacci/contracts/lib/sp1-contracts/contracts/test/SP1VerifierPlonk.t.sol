// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {SP1Verifier} from "../src/v2.0.0/SP1VerifierPlonk.sol";

contract SP1VerifierPlonkTest is Test {
    bytes32 internal constant PROGRAM_VKEY =
        bytes32(0x00365bdf422d83b7f9de1787cdc48d6ca03fe0451007d77ad1c7466a69ad6926);
    bytes internal constant PUBLIC_VALUES =
        hex"00000000000000000000000000000000000000000000000000000000000000140000000000000000000000000000000000000000000000000000000000001a6d0000000000000000000000000000000000000000000000000000000000002ac2";
    bytes internal constant PROOF_VALID =
        hex"4aca240a112a67f2c13d8b8dacc742e32f76dfb437e08189a7be1b898ef5900cba9ddde32c97638c42d91b4b121afd7fe9995d64383e21cb8f1aa865ab54c8e12ce738b12e572815d426eb52b6f241f2ec9213739ff7875a59f452dc2651b287ddc922a21461a9398ed2543ccc59404aad24aba470ff1c41e6928349708abdff025a09c6224750c51ba5eceea94fb26ca36c45e2046dc19c212c68385e5aecc29de45a75249b4c5bc8f2ef9e7efa6ef6164681bdcd4fcbc7905318c7bb9fcd88a1e2e2aa1648b47e4c3d6fe83be2bd0b7a6bf43c743c152cee4e268ff23ed9c07c4ece25068dc688ba0585cf64a21c3e70cfa947e3781c829d838bad237fa79dc5e2fbbd04fb21e14b5dbed72a31ce63d2a93ea33499e08e2e4455a97240b50004b2d15a157fe397138716edaf76378a43813f1fbc9e1459059cbf4fd07c37bf980744f222d0c8acf43c139176bb9eade117df7cb3c7bf57e0aa3977b582a337bd45c7651e161930646f31834a3860fcdbaa88b7da1e2787bdd7f1197286b1034e666ad52841ed8f1e541cda9e18db8537265d670b32c45ce25099d43d1fc97adec544d325999da71be1f441bd82d172a6b02f399e8966544eedfa940b3174ab26577ebb1a539fa1ef24d8efd25195b8ecb8395a7e448a4823efe4027f63ae9b3c32b883028832c67748c6070272c73648f4da273d750d0e89a83569bf19aaed9eb721fe1c7e887c228a9c422edeed47e98e4d65f746e53dcc6969ce090ac0d8122b09fa126e4b26d9ff49fa5aad72a0cebd4d85a23aff1e0d34219818fedc1fde43297425cb919f4cd6395264bcf68236dbe5b0e9d22d59409de2a034270cfc154951782b18c45054782fa20fa85df52e9197d6fd68536b54450d88d5b2792d095145312678be524e71b862d05f796affe4fdd3012d33ff61a779d0fe2ea2590144e7b70cb8d202ef2a189f96e3bd1ee28847dda7569538caf9d5a9d74dff3984d10ae9053fac3882a176ae1fb749e1fcdb8e035662c2599f278b5db88295bf12c6889828722a1775ee15a26faeda6d27f2d9e051f14395e686eaf07ddd0b384453380805a2f16218d7e4d04f80c02e5c597959dbb7c858ee70d821a7f668af98ff55ff200d955374d13f5d11ac6c8cec58f39707deb0964eee1cc3b2351c0e8ff398aa0cde021aac27f93c0a297b623ad47f794a48380a91e83ab2e91bb2779fd24114";
    bytes internal constant PROOF_INVALID = hex"616a42052115dd50acf8e57f10c32ca72a6940";

    address internal verifier;

    function setUp() public virtual {
        verifier = address(new SP1Verifier());
    }

    /// @notice Should succeed when the proof is valid.
    function test_VerifyProof_WhenPlonk() public view {
        SP1Verifier(verifier).verifyProof(PROGRAM_VKEY, PUBLIC_VALUES, PROOF_VALID);
    }

    /// @notice Should revert when the proof is invalid.
    function test_RevertVerifyProof_WhenPlonk() public view {
        SP1Verifier(verifier).verifyProof(PROGRAM_VKEY, PUBLIC_VALUES, PROOF_VALID);
    }
}