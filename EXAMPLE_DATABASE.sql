
CREATE TABLE `TEST_TABLE` (
  `ITEMCODE` varchar(20) NOT NULL,
  `ITEMNAME` varchar(50) DEFAULT NULL,
  `MAX` int(11) DEFAULT 0,
  `MIN` int(11) DEFAULT 0,
  `CREATE_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `UPDATE_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ITEMCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

CREATE TABLE `TEST_LOGS` (
  `ITEMCODE` varchar(20) NOT NULL,
  `ITEMNAME` varchar(50) DEFAULT NULL,
  `QTY` int(11) DEFAULT 0,
  `CREATE_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `UPDATE_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ITEMCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

CREATE TABLE `TERMINAL_INFO` (
  `TERM_ID` char(6) NOT NULL DEFAULT '',
  `BRANCH` char(4) DEFAULT NULL,
  `VENDORNO` char(20) DEFAULT NULL,
  `PRODUCTNO` char(20) DEFAULT NULL,
  `PMINO` char(20) DEFAULT NULL,
  `BATCH` int(11) DEFAULT NULL,
  `SLIPNO` int(11) DEFAULT NULL,
  `TERM_NAME` char(50) DEFAULT NULL,
  `TERM_FOOD` char(50) DEFAULT NULL,
  `PAYPERCENT` decimal(7,2) DEFAULT NULL,
  `PAYPERDAY` decimal(9,2) DEFAULT NULL,
  `INCLUDEVAT` varchar(5) DEFAULT NULL,
  `INV_PRINT` char(1) DEFAULT NULL,
  `INV_NAME` char(100) DEFAULT NULL,
  `INV_ADDR` char(100) DEFAULT NULL,
  `TERM_FLAG` char(1) DEFAULT NULL,
  `TYPEPAY` varchar(5) DEFAULT NULL,
  `STAFFOFCHARGE` decimal(7,2) DEFAULT NULL,
  `STAFFPRODUCTNO` char(20) DEFAULT NULL,
  `CUSTOMER_REF` char(6) DEFAULT NULL,
  `RENTAL_ID` char(8) DEFAULT NULL,
  `HORIZON_SENT` varchar(5) DEFAULT NULL,
  `LEASE_TYPE` char(3) DEFAULT NULL,
  `CLUBCARD_CODE` varchar(15) DEFAULT NULL,
  `CLUBCARD_AMT` decimal(11,2) DEFAULT NULL,
  `CLUBCARD_POINT` bigint(20) DEFAULT NULL,
  `TERMINAL_TYPE` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`TERM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

INSERT INTO `TEST_TABLE` (`ITEMCODE`, `ITEMNAME`, `MAX`, `MIN`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
('ITEM001', 'ITEM001', 3, 0, '2022-11-21 10:02:16', '2022-11-21 10:02:16'),
('ITEM002', 'ITEM002', 3, 0, '2022-11-21 10:02:16', '2022-11-21 10:02:16'),
('ITEM003', 'ITEM003', 3, 0, '2022-11-21 10:02:16', '2022-11-21 10:02:16');

INSERT INTO `TERMINAL_INFO` (`TERM_ID`, `BRANCH`, `VENDORNO`, `PRODUCTNO`, `PMINO`, `BATCH`, `SLIPNO`, `TERM_NAME`, `TERM_FOOD`, `PAYPERCENT`, `PAYPERDAY`, `INCLUDEVAT`, `INV_PRINT`, `INV_NAME`, `INV_ADDR`, `TERM_FLAG`, `TYPEPAY`, `STAFFOFCHARGE`, `STAFFPRODUCTNO`, `CUSTOMER_REF`, `RENTAL_ID`, `HORIZON_SENT`, `LEASE_TYPE`, `CLUBCARD_CODE`, `CLUBCARD_AMT`, `CLUBCARD_POINT`, `TERMINAL_TYPE`) VALUES
('517701', '5177', '0000000000', '0000000000', 'xxxxxxxxxxxx1', 1, 1, 'นางขนิษฐา   อารมย์สุข', 'XXX', 35.00, 0.00, '1', '1', 'นางขนิษฐา   อารมย์สุข', '132 ถ.แก้วเงินทอง แขวงบางพรม เขตตลิ่งชัน กรุงเทพมห', '1', '1', 0.00, '/', '519213', '000FG001', 'Y', '', NULL, 100.00, 1, 'D'),
('517702', '5177', '0000000000', '0000000000', 'xxxxxxxxxxxx2', 1, 1, 'สเต็ก  สลัด-เครื่องเคียง', 'XXX', 35.00, 0.00, '1', '1', 'นางสาว มาริสา ปรากฏรัตน์', '360/97 ถนนหลวงแพ่ง แขวงทับยาว เขตลาดกระบัง กทม.', '1', '1', 0.00, '/', '555879', '000FG002', 'Y', '', NULL, 100.00, 1, 'D'),
('517703', '5177', '0000000000', '0000000000', 'xxxxxxxxxxxx3', 1, 1, 'นางสาว เตือนใจ เดียวตระกูล', 'XXX', 35.00, 0.00, '1', '1', 'นางสาว เตือนใจ เดียวตระกูล', '118 ซอยริมทางด่วน 2 แขวงพระโขนงใต้ เขตพระโขนง กรุง', '1', '1', 0.00, '/', '519218', '000FG003', 'Y', '', NULL, 100.00, 1, 'D'),
('517704', '5177', '0000000000', '0000000000', 'xxxxxxxxxxxx4', 1, 1, 'ราดหน้า สุกี้ สยามอินเตอร์', 'XXX', 35.00, 0.00, '1', '1', 'บริษัท ราดหน้า เชลล์ชวนชิม หลังห้อยเทียนเหลา จำกัด', '3/17 ถนนแจ้งวัฒนะ ตำบลบางพูด อำเภอปากเกร็ด จังหวัด', '1', '1', 0.00, '/', '519250', '000FG004', 'Y', '', NULL, 100.00, 1, 'D');


{
            "TERM_ID": "517705",
            "BRANCH": "5177",
            "VENDORNO": "0000000000",
            "PRODUCTNO": "0000000000",
            "PMINO": "xxxxxxxxxxxx4",
            "BATCH": 1,
            "SLIPNO": 1,
            "TERM_NAME": "TEST517705",
            "TERM_FOOD": "XXX",
            "PAYPERCENT": 35.0,
            "PAYPERDAY": 0.0,
            "INCLUDEVAT": "1",
            "INV_PRINT": "1",
            "INV_NAME": "บริษัท ราดหน้า เชลล์ชวนชิม หลังห้อยเทียนเหลา จำกัด",
            "INV_ADDR": "3/17 ถนนแจ้งวัฒนะ ตำบลบางพูด อำเภอปากเกร็ด จังหวัด",
            "TERM_FLAG": "1",
            "TYPEPAY": "1",
            "STAFFOFCHARGE": 0.0,
            "STAFFPRODUCTNO": "/",
            "CUSTOMER_REF": "519250",
            "RENTAL_ID": "000FG004",
            "HORIZON_SENT": "Y",
            "LEASE_TYPE": "",
            "CLUBCARD_CODE": null,
            "CLUBCARD_AMT": 100.0,
            "CLUBCARD_POINT": 1,
            "TERMINAL_TYPE": "D"
     }