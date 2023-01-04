const firebase = require("@firebase/rules-unit-testing");
const { serverTimestamp: st } = require("@firebase/firestore");
const fs = require("fs");
const { v4: uuidv4 } = require("uuid");

process.env.FIRESTORE_EMULATOR_HOST = "localhost:8080";
const projectId = "merubo-develop";

const serverTimestamp = () => st();
// テストプロジェクト環境の作成
let testEnv;
let db;
let userId;

// // ログイン情報つきのContextを作成し、そこから Firestore インスタンスを得る
// const authenticatedContext = testEnv.authenticatedContext("uid string");
// const clientDB = authenticatedContext.firestore();

// // ゲストContextを作成し、そこから Firestore インスタンスを得る
// const unauthenticatedContext = testEnv.unauthenticatedContext();
// const guestClientDB = unauthenticatedContext.firestore();

beforeAll(async () => {
  testEnv = await firebase.initializeTestEnvironment({
    projectId,
    firestore: {
      rules: fs.readFileSync("./firestore.rules", "utf8"),
    },
  });
});

beforeEach(async () => {
  userId = uuidv4();
  db = testEnv.authenticatedContext(userId).firestore();
  // db = unauthenticatedContext = testEnv
  //   .unauthenticatedContext(userId)
  //   .firestore();
});

afterAll(async () => {
  await testEnv.cleanup();
});

afterEach(async () => {
  await testEnv.clearFirestore();
});

describe("/users", () => {
  describe("create", () => {
    it("正しいデータであれば、作成できる", async () => {
      const timeStamp = serverTimestamp();
      await firebase.assertSucceeds(
        db.collection("users").doc(userId).set({
          id: userId,
          name: "小川翔生",
          createdAt: timeStamp,
          updatedAt: timeStamp,
        })
      );
    });
  });
  describe("get", () => {
    it("正しくデータが取得できること", async () => {
      const timeStamp = serverTimestamp();
      await db.collection("users").doc(userId).set({
        id: userId,
        name: "小川翔生",
        createdAt: timeStamp,
        updatedAt: timeStamp,
      });
      await firebase.assertSucceeds(db.collection("users").doc(userId).get());
    });
  });

  describe("list", () => {
    it("正しくデータが取得できること", async () => {
      const timeStamp = serverTimestamp();
      await db.collection("users").doc(userId).set({
        id: userId,
        name: "小川翔生",
        createdAt: timeStamp,
        updatedAt: timeStamp,
      });
      await firebase.assertSucceeds(db.collection("users").get());
    });
  });
});

describe("/message_bords", () => {
  describe("create", () => {
    it("正しいデータであれば、作成できる", async () => {
      const timeStamp = serverTimestamp();
      const messageBordId = uuidv4();
      const messageBordRef = db.collection("message_bords").doc(messageBordId);
      // messagebords作成
      await firebase.assertSucceeds(
        messageBordRef.set({
          id: messageBordId,
          title: "title",
          lastMessage: "lastMessage",
          ownerUserName: "管理者",
          receiverUserName: "受取人",
          receivedAt: timeStamp,
          status: "edit",
          type: "type1",
          category: "ありがとう",
        })
      );
    });
  });
  describe("get", () => {
    it("正しいデータが取得できること", async () => {
      const timeStamp = serverTimestamp();
      const messageBordId = uuidv4();
      const messageBordRef = db.collection("message_bords").doc(messageBordId);
      await db
        .collection("users")
        .doc(userId)
        .collection("own_message_bords")
        .doc(messageBordId)
        .set({
          messageBordRef: messageBordRef,
          role: "owner",
        });

      // messagebords作成
      await messageBordRef.set({
        id: messageBordId,
        title: "title",
        lastMessage: "lastMessage",
        ownerUserName: "管理者",
        receiverUserName: "受取人",
        receivedAt: timeStamp,
        status: "edit",
        type: "type1",
        category: "ありがとう",
      });
      await firebase.assertSucceeds(
        db.collection("message_bords").doc(messageBordId).get()
      );
      // await firebase.assertSucceeds(db.collection("message_bords").doc(messageBordId).get());
    });
  });
});

describe("/own_message_bords", () => {
  describe("create", () => {
    it("正しいデータであれば、作成できる", async () => {
      const timeStamp = serverTimestamp();
      const messageBordId = uuidv4();
      const messageBordRef = db.collection("message_bords").doc(messageBordId);
      // messagebords作成
      await messageBordRef.set({
        id: messageBordId,
        title: "title",
        lastMessage: "lastMessage",
        ownerUserName: "管理者",
        receiverUserName: "受取人",
        receivedAt: timeStamp,
        status: "edit",
        type: "type1",
        category: "ありがとう",
      });
      await firebase.assertSucceeds(
        db
          .collection("users")
          .doc(userId)
          .collection("own_message_bords")
          .doc(messageBordId)
          .set({
            messageBordRef: messageBordRef,
            role: "receiver",
          })
      );
    });
  });
});
