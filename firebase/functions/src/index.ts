import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp;

export const attachCreatedAtFirst = functions.firestore
  .document("{collection}/{document}")
  .onCreate(async (snap) => {
    const fireStore = admin.firestore();
    await fireStore.doc(snap.ref.path).set(
      {
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
        updatedAt: admin.firestore.FieldValue.serverTimestamp(),
      },
      { merge: true }
    );
  });

export const attachUpdatedAtFirst = functions.firestore
  .document("{collection}/{document}")
  .onUpdate(async (change) => {
    const newValue = change.after.data();
    const fireStore = admin.firestore();
    const previousValue = change.before.data();
    if (newValue.updatedAt.isEqual(previousValue.updatedAt)) {
      const now = admin.firestore.FieldValue.serverTimestamp();
      await fireStore.doc(change.after.ref.path).set(
        {
          updatedAt: now,
        },
        { merge: true }
      );
    } else {
      return;
    }
  });

export const attachCreatedAtSecond = functions.firestore
  .document("{collection}/{document}/{collection}/{document}")
  .onCreate(async (snap) => {
    const fireStore = admin.firestore();
    await fireStore.doc(snap.ref.path).set(
      {
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
        updatedAt: admin.firestore.FieldValue.serverTimestamp(),
      },
      { merge: true }
    );
  });

export const attachUpdatedAtSecond = functions.firestore
  .document("{collection}/{document}/{collection}/{document}")
  .onUpdate(async (change) => {
    const newValue = change.after.data();
    const fireStore = admin.firestore();
    const previousValue = change.before.data();
    if (newValue.updatedAt.isEqual(previousValue.updatedAt)) {
      const now = admin.firestore.FieldValue.serverTimestamp();
      await fireStore.doc(change.after.ref.path).set(
        {
          updatedAt: now,
        },
        { merge: true }
      );
    } else {
      return;
    }
  });

export const onCreaedUser = functions.auth.user().onCreate(async (user) => {
  const fireStore = admin.firestore();
  await fireStore.collection("users").doc(user.uid).set({
    id: user.uid,
    name: user.displayName,
  });
});
