/* eslint-disable no-eval */
/* eslint-disable @lwc/lwc/no-async-operation */
/* eslint-disable no-restricted-globals */
import { LightningElement, wire } from "lwc";
import getParent from "@salesforce/apex/getParentChildrecords.getParent";
import updatechld from "@salesforce/apex/updateChildrecords.updatechld";


import LightningConfirm from "lightning/confirm";


export default class ParentChild extends LightningElement {
parList;
childrecordsId;
@wire(getParent)
wiredParent({ data, error }) {
if (data) {
this.parList = data;
this.error = undefined;
} else {
this.error = error;
this.data = undefined;
}
}


async handleConfirmClick(event) {
this.childrecordsId = event.target.value;
const res = await LightningConfirm.open({
message: "Are you sure you want to approve this record?",
variant: "default", // headerless
label: "Approve a record"
});
if (res) {
updatechld({ Id: this.childrecordsId }).then((result) => {

setTimeout(function () {
window.location.reload();
}, 1000);
});
}
}
}