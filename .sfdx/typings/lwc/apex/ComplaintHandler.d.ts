declare module "@salesforce/apex/ComplaintHandler.getDepartments" {
  export default function getDepartments(): Promise<any>;
}
declare module "@salesforce/apex/ComplaintHandler.createComplaint" {
  export default function createComplaint(param: {citizenName: any, email: any, phone: any, departmentId: any, description: any, priority: any}): Promise<any>;
}
