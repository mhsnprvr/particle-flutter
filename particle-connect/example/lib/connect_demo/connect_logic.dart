import 'package:oktoast/oktoast.dart';
import 'package:particle_auth/particle_auth.dart';
import 'package:particle_connect/particle_connect.dart';
import 'package:particle_connect_example/mock/test_account.dart';
import 'package:particle_connect_example/mock/transaction_mock.dart';

class ConnectLogic {
  static ChainInfo currChainInfo = ChainInfo.Ethereum;

  static WalletType walletType = WalletType.metaMask;

  static late Siwe siwe;

  static Account? account;

  static String getPublicAddress() {
    return account?.publicAddress ?? "";
  }

  static void init() {
    // Get your project id and client key from dashboard, https://dashboard.particle.network
    const projectId =
        "772f7499-1d2e-40f4-8e2c-7b6dd47db9de"; //772f7499-1d2e-40f4-8e2c-7b6dd47db9de
    const clientK =
        "ctWeIc2UBA6sYTKJknT9cu9LBikF00fbk1vmQjsV"; //ctWeIc2UBA6sYTKJknT9cu9LBikF00fbk1vmQjsV
    ParticleInfo.set(projectId, clientK);

    final dappInfo = DappMetaData(
        "75ac08814504606fc06126541ace9df6",
        "Particle Connect",
        "https://connect.particle.network/icons/512.png",
        "https://connect.particle.network",
        "Particle Connect Flutter Demo");

    ParticleConnect.init(currChainInfo, dappInfo, Env.dev);

    // List<ChainInfo> chainInfos = <ChainInfo>[
    //   EthereumChain.mainnet(),
    //   PolygonChain.mainnet()
    // ];
    // ParticleConnect.setWalletConnectV2SupportChainInfos(chainInfos);
  }

  static void setChainInfo() async {
    bool isSuccess = await ParticleAuth.setChainInfo(currChainInfo);
    print("setChainInfo: $isSuccess");
  }

  static void getChainInfo() async {
    ChainInfo chainInfo = await ParticleAuth.getChainInfo();
    print(
        "getChainInfo chain id: ${chainInfo.id} chain name: ${chainInfo.name}");
    showToast(
        "getChainInfo chain id: ${chainInfo.id} chain name: ${chainInfo.name}");
  }

  static void connect() async {
    try {
      final account = await ParticleConnect.connect(walletType);
      showToast('connect: $account');
      print("connect: $account");
      ConnectLogic.account = account;
    } catch (error) {
      showToast('connect: $error');
      print("connect: $error");
    }
  }

  static void connectParticle() async {
    final messageHex = "0x${StringUtils.toHexString("Hello Particle")}";
    // authorization is an optional parameter, used to login and sign a message.
    final authorization = LoginAuthorization(messageHex, true);

    final config = ParticleConnectConfig(LoginType.email, "",
        [SupportAuthType.all], SocialLoginPrompt.select_account,
        authorization: authorization);
    try {
      final account =
          await ParticleConnect.connect(WalletType.particle, config: config);
      showToast('connectParticle: $account');
      print("connectParticle: $account");
      ConnectLogic.account = account;
    } catch (error) {
      showToast('connectParticle: $error');
      print("connectParticle: $error");
    }
  }

  static void connectWalletConnect() async {
    try {
      final account = await ParticleConnect.connectWalletConnect();
      showToast('connectWalletConnect: $account');
      print("connectWalletConnect: $account");
      ConnectLogic.account = account;
    } catch (error) {
      showToast('connectWalletConnect: $error');
      print("connectWalletConnect: $error");
    }
  }

  static void isConnected() async {
    try {
      bool isConnected =
          await ParticleConnect.isConnected(walletType, getPublicAddress());
      showToast("isConnected: $isConnected");
      print("isConnected: $isConnected");
    } catch (error) {
      showToast("isConnected: $error");
      print("isConnected: $error");
    }
  }

  static void getAccounts() async {
    try {
      List<Account> accounts = await ParticleConnect.getAccounts(walletType);
      showToast("getAccounts: $accounts");
      print("getAccounts: $accounts");
    } catch (error) {
      showToast("getAccounts: $error");
      print("getAccounts: $error");
    }
  }

  static void disconnect() async {
    try {
      String result =
          await ParticleConnect.disconnect(walletType, getPublicAddress());
      print("disconnect: $result");
      showToast("disconnect: $result");
    } catch (error) {
      print("disconnect: $error");
      showToast("disconnect: $error");
    }
  }

  static void signInWithEthereum() async {
    try {
      const domain = "login.xyz";
      const uri = "https://login.xyz/demo#login";
      ConnectLogic.siwe = await ParticleConnect.signInWithEthereum(
          walletType, getPublicAddress(), domain, uri);
      print(
          "signInWithEthereum message:${ConnectLogic.siwe.message}}  signature:${ConnectLogic.siwe.signature}");
      showToast(
          "signInWithEthereum message:${ConnectLogic.siwe.message}}  signature:${ConnectLogic.siwe.signature}");
    } catch (error) {
      print("signInWithEthereum: $error");
      showToast("signInWithEthereum: $error");
    }
  }

  static void verify() async {
    try {
      bool result = await ParticleConnect.verify(walletType, getPublicAddress(),
          ConnectLogic.siwe.message, ConnectLogic.siwe.signature);
      print("verify: $result");
      showToast("verify: $result");
    } catch (error) {
      print("verify: $error");
      showToast("verify: $error");
    }
  }

  static void signMessage() async {
    final messageHex = "0x${StringUtils.toHexString("Hello Particle")}";
    try {
      String signature = await ParticleConnect.signMessage(
          walletType, getPublicAddress(), messageHex);
      print("signMessage: $signature");
      showToast("signMessage: $signature");
    } catch (error) {
      print("signMessage: $error");
      showToast("signMessage: $error");
    }
  }

  static void signTransaction() async {
    if (currChainInfo.isSolanaChain()) {
      final transaction =
          await TransactionMock.mockSolanaTransaction(getPublicAddress());
      try {
        String signature = await ParticleConnect.signTransaction(
            walletType, getPublicAddress(), transaction);
        print("signTransaction: $signature");
        showToast("signTransaction: $signature");
      } catch (error) {
        print("signTransaction: $error");
        showToast("signTransaction: $error");
      }
    } else {
      showToast('only solana chain support!');
    }
  }

  static void signAllTransactions() async {
    if (currChainInfo.isSolanaChain()) {
      final transacton1 =
          await TransactionMock.mockSolanaTransaction(getPublicAddress());
      final transacton2 =
          await TransactionMock.mockSolanaTransaction(getPublicAddress());
      List<String> trans = <String>[];
      trans.add(transacton1);
      trans.add(transacton2);
      try {
        String signature = await ParticleConnect.signAllTransactions(
            walletType, getPublicAddress(), trans);
        print("signAllTransaction: $signature");
        showToast("signAllTransaction: $signature");
      } catch (error) {
        print("signAllTransaction: $error");
        showToast("signAllTransaction: $error");
      }
    } else {
      showToast('only solana chain support!');
    }
  }

  static void signAndSendTransaction() async {
    String transaction;
    if (currChainInfo.isSolanaChain()) {
      transaction =
          await TransactionMock.mockSolanaTransaction(getPublicAddress());
    } else {
      transaction = await TransactionMock.mockEvmSendNative(getPublicAddress());
    }
    try {
      String signature = await ParticleConnect.signAndSendTransaction(
          walletType, getPublicAddress(), transaction);
      print("signAndSendTransaction: $signature");
      showToast("signAndSendTransaction: $signature");
    } catch (error) {
      print("signAndSendTransaction: $error");
      showToast("signAndSendTransaction: $error");
    }
  }

  static void signTypedData() async {
    if (currChainInfo.isSolanaChain()) {
      showToast("only evm chain support!");
      return;
    }

    final chainId = await ParticleAuth.getChainId();

    String typedData = '''
{"types":{"OrderComponents":[{"name":"offerer","type":"address"},{"name":"zone","type":"address"},{"name":"offer","type":"OfferItem[]"},{"name":"consideration","type":"ConsiderationItem[]"},{"name":"orderType","type":"uint8"},{"name":"startTime","type":"uint256"},{"name":"endTime","type":"uint256"},{"name":"zoneHash","type":"bytes32"},{"name":"salt","type":"uint256"},{"name":"conduitKey","type":"bytes32"},{"name":"counter","type":"uint256"}],"OfferItem":[{"name":"itemType","type":"uint8"},{"name":"token","type":"address"},{"name":"identifierOrCriteria","type":"uint256"},{"name":"startAmount","type":"uint256"},{"name":"endAmount","type":"uint256"}],"ConsiderationItem":[{"name":"itemType","type":"uint8"},{"name":"token","type":"address"},{"name":"identifierOrCriteria","type":"uint256"},{"name":"startAmount","type":"uint256"},{"name":"endAmount","type":"uint256"},{"name":"recipient","type":"address"}],"EIP712Domain":[{"name":"name","type":"string"},{"name":"version","type":"string"},{"name":"chainId","type":"uint256"},{"name":"verifyingContract","type":"address"}]},"domain":{"name":"Seaport","version":"1.1","chainId":$chainId,"verifyingContract":"0x00000000006c3852cbef3e08e8df289169ede581"},"primaryType":"OrderComponents","message":{"offerer":"0x6fc702d32e6cb268f7dc68766e6b0fe94520499d","zone":"0x0000000000000000000000000000000000000000","offer":[{"itemType":"2","token":"0xd15b1210187f313ab692013a2544cb8b394e2291","identifierOrCriteria":"33","startAmount":"1","endAmount":"1"}],"consideration":[{"itemType":"0","token":"0x0000000000000000000000000000000000000000","identifierOrCriteria":"0","startAmount":"9750000000000000","endAmount":"9750000000000000","recipient":"0x6fc702d32e6cb268f7dc68766e6b0fe94520499d"},{"itemType":"0","token":"0x0000000000000000000000000000000000000000","identifierOrCriteria":"0","startAmount":"250000000000000","endAmount":"250000000000000","recipient":"0x66682e752d592cbb2f5a1b49dd1c700c9d6bfb32"}],"orderType":"0","startTime":"1669188008","endTime":"115792089237316195423570985008687907853269984665640564039457584007913129639935","zoneHash":"0x3000000000000000000000000000000000000000000000000000000000000000","salt":"48774942683212973027050485287938321229825134327779899253702941089107382707469","conduitKey":"0x0000000000000000000000000000000000000000000000000000000000000000","counter":"0"}}
    ''';

    String typedDataHex = "0x${StringUtils.toHexString(typedData)}";
    try {
      String signature = await ParticleConnect.signTypedData(
          walletType, getPublicAddress(), typedDataHex);
      print("signTypedData: $signature");
      showToast("signTypedData: $signature");
    } catch (error) {
      print("signTypedData: $error");
      showToast("signTypedData: $error");
    }
  }

  static void importPrivateKey() async {
    String privateKey;
    if (currChainInfo.isSolanaChain()) {
      privateKey = TestAccount.solana.privateKey;
    } else {
      privateKey = TestAccount.evm.privateKey;
    }

    try {
      final account =
          await ParticleConnect.importPrivateKey(walletType, privateKey);
      showToast('importPrivateKey: $account');
      print("importPrivateKey: $account");
      ConnectLogic.account = account;
    } catch (error) {
      showToast('importPrivateKey: $error');
      print("importPrivateKey: $error");
    }
  }

  static void importMnemonic() async {
    String mnemonic;
    if (currChainInfo.isSolanaChain()) {
      mnemonic = TestAccount.solana.mnemonic;
    } else {
      mnemonic = TestAccount.evm.mnemonic;
    }

    try {
      final account =
          await ParticleConnect.importMnemonic(walletType, mnemonic);
      showToast('importMnemonic: $account');
      print("importMnemonic: $account");
      ConnectLogic.account = account;
    } catch (error) {
      showToast('importMnemonic: $error');
      print("importMnemonic: $error");
    }
  }

  static void exportPrivateKey() async {
    try {
      String privateKey = await ParticleConnect.exportPrivateKey(
          walletType, getPublicAddress());
      showToast('exportPrivateKey: $privateKey');
      print("exportPrivateKey: $privateKey");
    } catch (error) {
      showToast('exportPrivateKey: $error');
      print("exportPrivateKey: $error");
    }
  }

  static void walletTypeState() async {
    print(await ParticleConnect.walletReadyState(WalletType.metaMask));
    print(await ParticleConnect.walletReadyState(WalletType.rainbow));
    print(await ParticleConnect.walletReadyState(WalletType.trust));
    print(await ParticleConnect.walletReadyState(WalletType.imToken));
    print(await ParticleConnect.walletReadyState(WalletType.bitKeep));
    print(await ParticleConnect.walletReadyState(WalletType.math));
    print(await ParticleConnect.walletReadyState(WalletType.omni));
    print(await ParticleConnect.walletReadyState(WalletType.zerion));
    print(await ParticleConnect.walletReadyState(WalletType.alpha));
  }

  static void reconnectIfNeed() {
    ParticleConnect.reconnectIfNeeded(walletType, getPublicAddress());
  }
}
