enum AppFlavor { uat, prod }

enum DeviceType { Mobile, Tablet, Desktop }

enum NrcType { newnrc, oldnrc }

enum PensionerType { pensioner, nominee }

enum UserType { USER, AGENT } // AGENT, MERCHANT, USER

enum UserStatus { ACTIVE }

enum OperatorType { ATOM, U9, MPT, MYTEL, MEC }

enum BillType { Government, Electricity, Internet }

enum TransStatus { DEBIT, CREDIT }

enum AgentType { PMAG, PMPA, PMCS }

enum TransactionType { PENSION_CASH_OUT }

enum LivenessType { LIVENESSVERIFY }

enum CashoutType { PINSIN_PAY, PENSION_ACCOUNT }

enum BillService {
  //gov
  YCDC,
  IRD,
  CUSTOMS,

  //electricity
  electricityYgn,
  electricityMdy,
  electricityNpt,

  //Insernet
  Hi,
  Ananda,
  FiveBB,
}

enum KYCStatus {
  Approved,
  Inactive,
  Pending,
  Suspended,
  Blocked,
  Rejected,
  lv1checked,
  lv2checked,
  lv3checked,
}

enum TransCode {
  ALL,
  TOP_UP,
  PEN_CASHOUT, // Normal Cashout
  QR_CASH_OUT, // QR Cashout
  TRANSFER, // Normal Transfer
  QR_TRANSFER, // QR Transfer
  PEN_CASHIN, // CASH_IN,
  PENSION_TO_WALLET,
  AGENT_TO_AGENT,
  AGENT_TO_PENSION,
  PENSION_TO_AGENT,
  PENSION_TO_PENSION,
}
