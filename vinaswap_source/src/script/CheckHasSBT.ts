import { config } from 'dotenv'
config();

import { ethers } from 'ethers'
import IIdentitySBT_ABI from '@/abis/IdentifySBT.json'

const RPC_URL = process.env.NEXT_PUBLIC_RPC_URL || "";
const IDENTITY_SBT_CONTRACT_ADDRESS = "0xF555752b80FD128421730B540d2D63542C9221F6";

export async function checkHasSBT(userAddress: string) {
    try {
        const provider = new ethers.providers.JsonRpcProvider(RPC_URL);
        const identitySBTContract = new ethers.Contract(
            IDENTITY_SBT_CONTRACT_ADDRESS,
            IIdentitySBT_ABI.abi,
            provider
        );
        
        const hasToken = await identitySBTContract.hasToken(userAddress);
        
        return hasToken;
    } catch (error) {
        console.error('Error checking has SBT:', error);
        return false;
    }
}
