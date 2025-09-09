-- Garanta antes: unique index em (cnj)
CREATE UNIQUE INDEX IF NOT EXISTS uniq_processes_cnj ON processes (cnj);
BEGIN;
INSERT INTO processes (id, cnj, court)
VALUES ('6e626b24-aac9-5277-91a6-607c58a10f09', '1085587-32.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d7c40e8f-8ced-5381-9972-2a5af3c03942', '1085610-75.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('95c507e6-aedb-55bb-9f6b-72abaadfc3b8', '1003476-38.2022.8.26.0655', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d7902553-2752-5886-afc2-6e02f1189019', '1085629-81.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dfde4f7d-9310-55fb-a403-49498c60d523', '1008207-94.2022.8.26.0229', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6c8c8d85-e140-5437-b1c7-1aeea0759571', '1003894-25.2021.8.26.0650', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('eead0f02-4b5f-5e24-919b-6999e8d29caa', '1006659-92.2021.8.26.0609', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('877440a6-d595-5fdf-ac01-649d5c4567c4', '1085645-35.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5ba5e847-1831-516e-865f-758199e76825', '0801382-44.2022.8.12.0024', 'TJMS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('44c71d87-7ae8-5be7-9f74-e1c674864a21', '1093493-73.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0ec572ad-5bf8-5a2b-955d-0485d395e86f', '0024526-93.2021.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cf067758-44dd-59b8-bb9d-38d7f5a2130b', '1003922-51.2021.8.26.0663', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7d09fbbf-0056-5c29-b89a-69aea95a3ce5', '1014149-95.2021.8.26.0309', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ff74f184-2405-55d6-8c4d-3113d2b83e34', '1085654-94.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('66fcaa88-cb31-55d7-ac29-78a28551f32e', '1085668-78.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d980a94f-0e5d-5914-9f23-dfaadfe245db', '1007598-63.2021.8.26.0127', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('62244d53-74c2-55fc-8a8f-2d03e8c7e32e', '1051114-23.2021.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7cfa8926-a356-5dbe-b7d8-90ae74c56f85', '1021277-05.2021.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('eb074ce1-df12-5f99-899e-c9315969be80', '1003616-34.2021.8.26.0291', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b38dbc8e-ab12-5139-986b-2987cc4794d7', '1021257-14.2021.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7c210ec9-4cd8-5619-8cad-3ad24b5e74c5', '1024212-36.2021.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7f82ceea-9257-5b8f-aa4e-79470a1691f6', '1085689-54.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ad670a7c-e30e-5a94-9180-4b94c7070c89', '1085695-61.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('630953b7-4984-5a22-a839-82b3d0bb3982', '1004582-20.2021.8.26.0445', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ba3c316e-24d3-5bba-8f86-156b5ffa3a65', '1002849-81.2021.8.26.0586', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c6113533-cac7-5b43-a94f-e7adb4beab54', '1009563-79.2021.8.26.0320', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2d3262ef-54a1-59fa-b65a-278df3e95d15', '1004543-62.2021.8.26.0529', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f67ea19b-9794-577d-bc37-a96da8c67301', '1006628-95.2021.8.26.0278', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('be452f70-6816-5936-9573-3bde98d210d8', '1005332-51.2021.8.26.0597', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4f3083b6-af95-5688-b314-043b57053513', '1007271-21.2021.8.26.0127', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9675ff46-c50f-556f-9974-1560856d6cd3', '0029147-20.2021.8.19.0038', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('746de0cf-5b63-5c61-8b0b-0c0780c0ea50', '1000744-85.2022.8.26.0299', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('32b29a5f-96df-5cb5-9673-7e02f3adc4a3', '2219549-12.2022.8.26.0000', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a52f8275-76c9-570a-8f80-b6b4846cbfee', '1051378-40.2021.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0177a800-d04e-5194-8f10-531e0fb9abc9', '1006277-37.2021.8.26.0565', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d1225432-4637-54bc-8e19-d19524d5376d', '1022248-26.2021.8.26.0577', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0cf0ceb9-44c7-5082-a51e-e51b80868f6e', '1085712-97.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0dc1da54-c643-5f03-bf3a-2f8ae66b1174', '1006863-20.2021.8.26.0292', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a415c243-31d9-5f60-bf25-e41b0dfd9a38', '1085768-33.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ce237fa9-e80f-5e93-a637-35d7e967f678', '1025203-12.2021.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('66c947f0-f4a7-5693-bc4a-edb14f4e870c', '1002136-30.2021.8.26.0288', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7754bbd7-7439-5d83-9d30-0d36c1a3299a', '1003419-88.2017.8.26.0010', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('34847a3e-52e0-51cc-9c03-d3cd684d22e2', '1085776-10.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a9864c1f-bd31-5994-8891-a7505eca8499', '1003079-51.2021.8.26.0319', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1f9a1f58-fbe9-5598-b2db-268e4130afa6', '1089190-16.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('14ba320e-805c-5c55-919a-24f61aa4b904', '1009701-18.2021.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c9d5045d-1bd8-54ce-b440-f081a2e6c8f3', '1004223-17.2021.8.26.0010', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e799eef1-b532-58fe-b09d-1b13fad4eba4', '1005328-14.2021.8.26.0597', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9c4fd6f0-40ae-50d0-bcf6-cd35e2c13c64', '1098986-31.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6934b3a6-f5bc-521c-832c-a39efe58c31d', '1085800-38.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2ae7568f-c53e-5173-b1b3-f03ea83eb830', '1009933-15.2021.8.26.0011', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e366652c-dbee-5cf0-b25c-41f0ae47811f', '1054002-62.2021.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9ec18db5-5401-5bfe-ab0a-a23fe87b2add', '1034668-55.2021.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('987120a7-5371-54a2-bdd9-4a29049cbef4', '1034679-84.2021.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e312da1d-eb36-5fd5-a96e-4c12c43da2a5', '1037903-30.2021.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('281169dd-c6c6-5eeb-8277-df161eedd42c', '1017267-21.2021.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('956f0ca0-2c23-5273-874f-baa51b10969a', '1006942-27.2021.8.26.0606', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('de736c93-8730-5c43-9581-f608acd87cbb', '1032639-59.2021.8.26.0506', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('31892082-6952-579e-8453-c4c9173e42bd', '1015501-88.2021.8.26.0309', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('99bfef53-4081-5988-bcf1-00fa54ac7010', '1098960-33.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e8f7bbbb-3e77-5b67-9591-0da8c23c3ed6', '1019315-52.2021.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3ac22090-d575-5e34-9e46-22af1b0ff679', '1009987-16.2021.8.26.0161', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1dd78f69-f861-585c-82fe-c8d56dbd0932', '1012127-94.2021.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ace09093-dbb6-584d-86d3-66d154d32f7f', '1015503-58.2021.8.26.0309', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d8fe507c-c924-5023-8249-6b227cb0493e', '1020789-34.2021.8.26.0562', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('df9623c3-838b-5b12-ac28-d90b3b731916', '1000776-67.2021.8.26.0512', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e63073dc-679d-5813-8ab5-05f580144d3a', '1022222-59.2021.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c3cc9cd0-6b49-59bc-a826-0010262f6da0', '1009084-02.2021.8.26.0348', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a12ca0b6-3b7e-504a-a061-820dad3ed901', '1022317-22.2021.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e8706bbf-738c-5155-bfc1-3e8c6823d673', '0008848-11.2022.8.26.0032', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('edb54bf4-4eb2-571d-9895-4e43733717d1', '1023378-90.2021.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d3123248-b2c8-5edc-9200-0a798ba3e7d0', '5014816-85.2021.8.21.0039', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('20d9cb8a-0aed-5b6e-9817-fd360fc311d0', '0019367-54.2021.8.16.0001', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4b72195c-6b9f-552e-b37b-4d8b21a5c5de', '5073762-17.2021.8.24.0023', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5508118e-2004-558a-9565-96aba1342b5e', '1001840-18.2022.8.26.0047', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('020fba6f-8527-564a-a2bb-0cb0c00d25a6', '1022646-04.2021.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a1ba4e5b-deb0-5d52-b1ae-711608a4f95f', '1023145-20.2021.8.26.0071', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9fd481ef-fd58-5773-9d65-ca09645eb658', '1038167-86.2021.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a711e3a0-79d0-5516-933c-97c84c6ccc16', '1011352-43.2021.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3692bcbf-fa28-592c-ae6e-d14e7bbffa84', '1022864-62.2021.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bd5ecda8-7839-57b3-8565-cf63559ba37b', '1010113-37.2021.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8c8802b6-b6dd-55b0-a422-602cf59d2a00', '1022882-83.2021.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ccd029ee-e02e-5a93-b89d-421435e6940b', '1027165-70.2021.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ba0f74f0-3e7a-5d43-baf6-eb64b3197bc6', '1005374-13.2021.8.26.0529', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b440bdfa-e5b5-59d9-8b4a-bdee01d72e00', '1038147-95.2021.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('60e77ff4-08f9-5d79-be8c-3273b2915ea8', '1013925-82.2021.8.26.0625', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2467450a-500d-51e6-bd84-010023eeb082', '1101188-78.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c77471e6-c997-504b-8344-c39c31016ce4', '1023876-89.2021.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('197373e9-c68f-52af-9e5f-4ca1deb14bf9', '1006698-27.2021.8.26.0565', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dcf1fd5a-5757-5bb9-9958-2b7e67ed1592', '1017522-75.2021.8.26.0361', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f5d63733-df85-5eed-9154-18c0c9a11889', '1002257-44.2022.8.26.0152', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('647557b1-44cb-5f5b-ac90-28f54c3df76b', '1001058-48.2022.8.26.0358', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c2639015-4a32-5af0-8212-8a1754a3770c', '1004700-21.2022.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b7d6c243-1617-520d-999d-90c6a95a7a12', '1024675-27.2021.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d83da3d8-4072-50f6-bde1-9e2ceff922be', '0051950-74.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('43327bf3-44d1-5e43-8b2b-61c8d0772b0e', '1011823-32.2021.8.26.0223', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b740a63d-4801-5bd5-b831-c850af17b1b2', '1062164-46.2021.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a18670cc-fad0-53c4-a782-2df07f330c42', '1059951-67.2021.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f8bd1376-1cd2-5d2b-8b97-8fff6b0394e1', '1038291-30.2021.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('65be9efe-2418-5c5f-86f8-042cee5a80e3', '0052253-88.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bf415448-9bc5-5c27-a434-d93935037b46', '1062170-53.2021.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0a9266fb-edd8-5e38-8772-981130092a30', '1052362-53.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('de1288b1-adb0-5162-bd91-e9d1e3853c68', '1114460-42.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f49c1bb3-95f4-51cf-a06b-69f0cab1cbea', '1029353-36.2021.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e8ff171a-0535-5dd1-88fe-f67694957caf', '1011510-63.2021.8.26.0161', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dd93f6e9-969b-5d55-a230-5da1585cc5fe', '1028493-53.2021.8.26.0577', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0a2d42e4-bd7c-5b2f-a7f6-982aa4595972', '1030450-71.2021.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1000bbf3-5845-5ed6-b825-d98cb7b28f5d', '1011427-18.2021.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b105fb8a-ea79-58f9-b2ab-26940a26e98f', '1030471-47.2021.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('32415ca6-5c33-5550-856e-c70dbe3671f5', '1011432-40.2021.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e2f7c4a7-c9a3-503c-8339-6afb209b024c', '1009302-07.2022.8.26.0506', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('578eb19a-598b-5024-a33f-5074d7abe5de', '1012282-06.2021.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cf3a173b-2bf6-538c-bdd1-3974fe152ee7', '1019580-58.2021.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2aa90cae-3b8d-5625-8fde-3382ac8e3c0f', '1021110-14.2021.8.26.0451', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5ce80aea-74ef-5754-9c62-d5fde2743ec2', '1013098-85.2021.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('55b150f7-4589-50d5-b893-9eb447949a69', '1007566-73.2021.8.26.0704', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ca326be2-7455-5e72-a643-a85d59210ff9', '1027226-77.2021.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('eda6d8db-b021-5181-ac27-792b8c673257', '1066167-44.2021.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f64035d0-a540-5a9b-9cd7-bdf3e602e958', '1049209-35.2021.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c0291eb2-4f28-514e-941e-49c6ee3e2e7c', '1009540-42.2021.8.26.0609', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3ab06c83-cc1b-5763-bb79-25c8790cbf86', '1014035-26.2021.8.26.0320', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c66c4e1a-9d6d-5001-9d1e-95cdd4589f74', '1131350-56.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('78a0ee0c-0abb-5b05-bcc9-5c8474492dd4', '1007784-32.2021.8.26.0533', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('06989ac3-2407-596e-808b-ffdce82a86c8', '1027852-29.2021.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fc244196-d751-5f98-ba4a-1fb88cbceb68', '1012283-73.2021.8.26.0011', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('11bf16b2-917c-5690-90a9-7ca862d08f25', '5006774-58.2022.8.13.0290', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('538aa362-1c7a-5c6e-a9ea-d98e10da9ef4', '1008737-59.2021.8.26.0609', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0099232c-fb78-5a0a-8de2-0ca693d53ba4', '0747831-62.2022.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('006d285a-5851-5e16-b25d-86c1b25570d2', '0005867-67.2022.8.19.0011', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ee2832b1-29f7-5be9-93a2-7c41fe0d0954', '1008108-22.2021.8.26.0048', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('15b6a56f-a403-5990-b169-3f2985a1be52', '0052322-23.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fafd33ad-2587-54e6-9235-f18cc021cea0', '1008404-45.2021.8.26.0565', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f57f0ce3-8f55-51fc-b7c4-daa776238eae', '1015171-85.2021.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0df00266-8be3-52db-9309-2798bf7a33ff', '1131498-67.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('82c0ff4d-47f4-5892-9f02-9c39b540caf0', '1073235-45.2021.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ba497128-6cf4-5351-a762-cc6418523ad3', '0052338-74.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c876e767-6d75-5a7c-8ae0-144c7780b26a', '1014839-21.2021.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fa2609e2-00c3-57ca-b65a-04ab9efc824c', '0053073-10.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d6b53f71-551b-54e5-b0bd-729387f98de5', '1134281-32.2021.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('593528b8-53fa-5233-913c-eeaf9725458a', '1029850-32.2021.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('67cf6881-b4ba-576b-8c43-07a918d174d5', '1015611-32.2021.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0d21d7b3-0c20-5335-a261-1ddc407e9029', '1001582-15.2022.8.26.0271', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1b6dcd25-9f99-565d-a278-fcac1aff1e95', '0003793-59.2025.8.17.2640', 'TJPE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6604f54e-a3b5-510b-b5f9-00e1d97bb5f6', '1000287-59.2022.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1c3beb07-ee69-5a9a-b9d8-9fb05d2951e8', '1012979-21.2021.8.26.0590', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ac00de80-91f5-58e2-883a-17cbb9576334', '1000153-21.2022.8.26.0624', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2b51cbbd-092f-5d0e-829d-ed3d073bcdc9', '5764290-65.2022.8.09.0044', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e1d148eb-c821-5543-992a-db72be94d4b4', '1000205-38.2022.8.26.0229', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ff885c0c-83b2-521e-952a-383ccf33a719', '1002499-62.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('79fc03e2-281f-5622-a8cf-ad099f78649b', '1046597-85.2021.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('69a21f11-35df-5047-a913-6006915dc85d', '1000288-02.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('153b8a80-97ba-5202-b242-7515b0ac8a77', '1000079-49.2022.8.26.0338', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('01c35028-f16b-5561-bd73-7304ca2e4b66', '1000215-97.2022.8.26.0127', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('38cee32e-b37f-52bc-8178-ea4cdf9c7943', '1000160-23.2022.8.26.0362', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('72ec8222-20b7-5697-81fb-8c4d0f090579', '1000408-93.2022.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('78ea073f-5729-57d0-98d0-4573380a185f', '1000839-39.2022.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4b79ce34-ba23-502b-932c-feb4f752bc67', '1043181-42.2021.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fe75d2ed-4d36-565f-81e4-2eef43cd0ddd', '1000040-21.2022.8.26.0219', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('50ea350c-dd62-5da5-a6f5-9a92a2e57cbf', '1000658-32.2022.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f7fa030d-f051-56b9-bbba-9025c06f5faf', '5005462-89.2022.8.13.0567', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c2f37bdc-f539-56ed-929d-17cf9a1c0075', '1000606-30.2022.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a09c3336-d432-5f69-9a1d-d61146674183', '1005023-20.2022.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ab0e9f33-0db7-52ed-97a9-e9d5d5689bcc', '1000207-04.2022.8.26.0198', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b422670f-83a3-54c7-8e2e-83c496ccb899', '1000798-24.2022.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('373fcba9-fb2c-5931-9d72-0af94bc9f8ac', '1001147-85.2022.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fe1024b2-8d3d-572a-aa67-fd09737b0ec6', '1000486-89.2022.8.26.0068', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('91bb3a26-3fca-5167-846b-92f573a7ae04', '1005463-52.2022.8.26.0577', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2234bbb6-0345-51a7-9110-8cddd1bd7bae', '1000275-30.2022.8.26.0302', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8e2a0755-7103-566a-9955-3b32476091a8', '1000825-15.2022.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c88037cb-b2fc-5895-a00d-b05a55db0203', '1000667-85.2022.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('30adafb1-47dd-5bb7-9cbe-b3dec4518891', '0001718-52.2022.8.19.0003', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ed304874-0a0e-558c-8b91-90c319984b1d', '1003237-50.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b119b2c7-5264-500a-b70e-a3194be76c27', '1003242-72.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5b5ce743-6260-5707-a592-30f39f093448', '1000104-79.2022.8.26.0106', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2c9cd45c-c216-5aa2-8658-b43a17611725', '2073132-85.2025.8.26.0000', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9451718b-0481-5b4c-819a-d9a3ad0ac4a6', '0062718-59.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('07041e45-181e-5efe-9580-6adde1ff5419', '1003265-18.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9f37643b-f620-51fc-b4a2-86a87edb1d1b', '1000743-18.2022.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8cc34c51-ea0c-5de4-a877-a019a6a1c136', '1000403-65.2022.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('75fcc7f0-de52-5125-86b9-15938a97b10b', '1000962-37.2022.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fe1069c4-21b3-54f2-ab7e-8bca6fb1d989', '1000175-85.2022.8.26.0428', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('643a73dc-fc28-57c6-b2f8-96c3506c06ed', '2249458-31.2024.8.26.0000', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('91a654db-2c85-5d9d-80db-ccd98469985e', '1003363-03.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5643c573-20d7-5f85-bc0d-5d4cdfd06f86', '1000348-08.2022.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('618d2d0c-5700-5393-9dae-1cb22b5162be', '1000084-61.2022.8.26.0115', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('85fa41f1-38d5-508d-ba09-7db817a0448f', '1000562-69.2022.8.26.0309', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('814353a1-3d25-59c2-bc98-b9c371152a8d', '1001262-09.2022.8.26.0127', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('477a0f3c-fc12-5b33-ae6f-f0713938eb70', '0003545-78.2022.8.19.0042', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f9e10f89-9e65-55aa-90ec-887f047cb882', '1002034-86.2022.8.26.0477', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b3ac9e90-9245-5487-a15a-05089c2d65d0', '1012777-25.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9c9a79b3-45cc-58b6-b8e3-a7e0a40bc7ac', '1012784-17.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('93e459c0-1dbc-5a71-91bb-2da59fa143a2', '1001027-95.2022.8.26.0077', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4f851b92-d641-520e-bd73-4483cbfa0179', '1003239-75.2022.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('efed4a2a-2ecd-57de-b688-90691613a87d', '1001531-23.2022.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c1524a80-773f-5858-baab-1ae36929c929', '1001376-40.2022.8.26.0161', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('99ce78d2-f05e-5e95-9d3b-0227e5be3d93', '2026086-37.2024.8.26.0000', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a3dec13a-e886-5605-8c0c-f769afae6759', '1008476-38.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b74d783e-a95e-5bf3-903b-7c86d9e661f7', '1001175-61.2022.8.26.0286', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5dc940cf-0c36-5396-9477-f72f0efe5eaf', '0705852-61.2022.8.02.0001', 'TJAL')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('22f0c434-b4d3-57b1-985e-6a10eec4027a', '1003749-57.2022.8.26.0577', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('34070991-f737-5199-9250-cab1441a3ae6', '1002820-93.2022.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a763040e-1c85-5ae6-8ffb-eb206aeed828', '1004420-62.2022.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c0164c64-160c-523b-836b-d8d2932b5382', '1002881-69.2022.8.26.0451', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8a8bb6b3-cb22-5846-b594-606e58ebc886', '1003188-09.2022.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b290d023-200b-5aa0-9f03-94240205a6ad', '1000942-03.2022.8.26.0565', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6969bac2-7cf4-55ce-8998-abbda3996902', '5130238-44.2022.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('366d8339-1563-5696-b01a-6a0a2ecc2121', '1028407-24.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e923760c-6e58-5cda-be3d-2b92f00e3a95', '5024224-83.2022.8.21.0001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f0e0f72e-55ae-5dfc-858a-4b58b391be8a', '1005817-59.2022.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e4f45bb8-15af-5ab9-a2eb-b6326407cb4d', '1002088-16.2022.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('02b76106-8335-539e-97a6-c3ec2668f0d6', '1003817-38.2022.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6589aebb-a931-509b-bfc6-385de8c60d50', '2103396-22.2024.8.26.0000', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('20c707c2-c125-5b35-b74a-2ba083ec3126', '1001144-65.2022.8.26.0278', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d49eb859-3eb6-5e64-bb1e-e1cb088d8dd8', '1003437-57.2022.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('517cca3e-cd97-5e5b-8428-ccd7228a2380', '1002027-10.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bf25688a-2f99-5830-a4d8-06e52adb0b6c', '1002119-85.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('78c653bf-6f27-5412-b1b2-7ae54b7d4dde', '5025597-34.2022.8.13.0079', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9b2d1c88-31bf-52f8-83de-d56240f89ed8', '0747838-54.2022.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('388f05e8-32f4-5fff-9741-bf8cd6edb601', '1001144-09.2022.8.26.0038', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('be0aaaf4-5de0-53eb-ad7c-423563bdff7b', '1005617-52.2022.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('af8079e4-d811-5cdc-840d-fac1ee0c9f80', '1004023-90.2022.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('459e5c6c-cc1b-5223-817a-09d6fb6f1893', '0049182-78.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0c6dac33-921a-5dcf-b58b-9480e3e20643', '1004844-86.2022.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6d59e3eb-d042-54d3-a05c-abfab00b4d16', '1004846-56.2022.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ebac1877-777d-5ed0-8237-4c5e6172c897', '0007880-85.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('def0bda8-bcb8-566f-9b03-bb39f21eb26f', '1002396-04.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c69d70a7-d9a5-5121-9d19-7cc29fe97396', '1018929-89.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('aa20d419-adde-5aa4-863d-9e0f44a255a6', '1003999-66.2022.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5f230b96-260f-52c2-a513-b028f95687f5', '0005733-67.2022.8.19.0002', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f1093d67-f462-59de-8ac9-2e8cdb6b0f98', '1005640-95.2022.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('443eb7d9-a2b1-511b-9569-3ec320daa660', '1004828-05.2022.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('61240418-65c9-5b26-bca5-36c0a069c1a8', '1004017-09.2022.8.26.0320', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fd956255-cf81-5833-af2f-c08b40077b5f', '1000619-30.2022.8.26.0619', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4b678b6c-73e1-5b37-9183-79ba7629b49b', '1002294-24.2022.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('839f0c2a-629c-507a-ba4e-51e2f338e6ca', '1019106-53.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('41a2e3da-36ba-59a6-becd-39d67a4cea5d', '1004076-71.2022.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('06b622c7-8028-5c89-a51c-8ca2e9d417b4', '1012186-66.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('30a76472-ede7-56bf-b65b-6af0c8121765', '1002439-38.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4e46b0dc-91b4-5a63-a27b-3cff2588edb0', '1030642-61.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('16fc46bf-6a63-5df8-8528-cf0a3f5dc8bf', '1006584-12.2022.8.26.0482', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c980088c-9a28-5a91-a3e5-619a697bbcf6', '1013063-58.2022.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('84eea4d1-5f63-5035-ace5-830515dc5d49', '1002106-71.2022.8.26.0704', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7b6dd0ea-0e6a-5933-9475-daf23b446e4b', '1019585-49.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('236cc39b-92ef-51db-bf3a-59c335d11814', '1031162-21.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b5a0d112-6ab6-5561-935d-56cde21ea590', '0020062-18.2024.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5bbae538-49f7-5d81-9e48-93f362c2b189', '1003080-82.2022.8.26.0066', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('786eb866-c5ac-5d4c-a3b5-8651a4da722d', '0076653-69.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0280c4ea-cc3a-59c3-b036-6326a64a7c15', '1019983-93.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9f9c1652-07a6-5e44-9d5b-24d0bdb00b7b', '1009346-86.2022.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('358fd2ed-2586-5a8c-b2ce-8b914b291491', '1004622-18.2022.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cb041bb7-4e6a-52d3-9d68-ae4eebf24b9a', '0078876-92.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ba7fe4f6-2a98-59d8-ab55-71ae0c26c8b7', '0078902-90.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('003fcb0f-ac5c-5c9b-87d2-cda87653ca4e', '1007989-53.2022.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9407e016-8975-563b-8056-6287ad286c1e', '1006225-38.2022.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2ccb4f5b-68d2-5afa-9e92-d86582e5ece7', '1020364-04.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7231ac08-5b73-5f38-8a71-2b375f63ac4c', '1009792-89.2022.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dab3a950-7137-53a3-87e1-ac70a8a10b5f', '5129025-03.2022.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8cc54862-dcd7-5421-92bd-3105bb61b1df', '5001471-42.2022.8.21.1001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1a289c05-f613-50aa-8a93-c0aa93420591', '0748370-28.2022.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f7f8dc30-0df3-58b4-a9bd-7d286d215f53', '5001550-24.2022.8.13.0878', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4d0d6b36-8265-5cdb-a0c7-bd8bdc44869f', '1033240-85.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e1436d4c-c443-5f82-83a5-94d854e67c46', '0013286-66.2022.8.12.0001', 'TJMS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d352268b-fb44-5a77-9c78-e4cd51769cbc', '1005632-67.2022.8.26.0309', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3396e02f-a62a-504e-b1cb-448265673928', '5006676-73.2022.8.13.0290', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5bcf9455-521e-554d-a665-5f941747d9b0', '1006885-38.2022.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d47f5d4d-3c37-55bd-a85a-29f00346e181', '1003654-44.2022.8.26.0248', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('61d347a2-eab0-535c-bb50-229160566c16', '5005736-84.2022.8.24.0005', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c78b3092-739d-57f0-9424-a2c62348c983', '5008584-77.2022.8.21.0021', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b5ec5e12-fd21-5067-af0c-be626120cc7c', '1007770-24.2022.8.26.0562', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a5be56dc-9475-5309-8167-edccb85aad6d', '0003781-72.2022.8.19.0028', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9c3a4f3c-d8bd-5433-b21f-76f218bf23a0', '1003028-24.2022.8.26.0604', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ebd2637b-7c16-5da2-b244-fe45bd423903', '1004051-44.2022.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('abfbc6ad-5537-59f9-ac51-ef3f01cffbdc', '1004805-98.2022.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('100281b2-67f7-5c48-8b04-ca4eda49668f', '1004497-14.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('befc6f37-b8d6-5ab8-82af-af1095495211', '1015481-66.2022.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('092d02eb-90ef-5f5f-8b17-6fb3f6faadda', '0849113-24.2022.8.14.0301', 'TJPA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5fee8f76-82f8-5126-a840-e2e48b8a6cb5', '1004504-06.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9195219b-337a-51cc-abe8-1130a767ce22', '1010857-22.2022.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e3e0968c-0235-5c6b-9dc0-2b8078447308', '1004509-28.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('51148608-da19-5ed9-bf46-ced61c45feb3', '1007784-32.2022.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f69aa07e-5a1d-5589-aed0-2c9a2a663bde', '1000702-89.2022.8.26.0443', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e6fafc44-0a68-5b8e-9d87-abedb780ac91', '0097663-72.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('74efdafc-840a-5734-991e-cd2fce6bee48', '1046652-83.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9d355d50-b165-54eb-b14d-bbfb167e0f4a', '0200370-64.2022.8.06.0136', 'TJCE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('118fd079-aa15-55b7-a9e2-e20a1a1ebfcc', '1004524-94.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7e16a599-19a1-5877-8aad-f87678efd97e', '1001551-07.2022.8.26.0655', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9daf3a8e-48b3-5759-8211-e1ba76d0e936', '1008906-42.2022.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b4dd426c-fbe9-560b-b202-4a2dd379037e', '5036691-85.2022.8.08.0024', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fd517876-16fe-59cd-8ac9-7c27dcbbdcc3', '1023249-88.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a0b7aee8-5fbd-59d6-bd6c-21baa5c09e21', '1001213-97.2022.8.26.0666', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d9b981b4-d48e-547d-ae17-0f22e2c3538c', '5003262-61.2023.8.13.0701', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('abaea965-c8e7-5aab-89b3-22a399b517d8', '5054541-64.2022.8.21.0001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bbd8a3b2-ae57-57db-8475-0bfabdead2dd', '1004271-42.2022.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dd748dc2-6083-5297-b10d-17b696aa91b1', '2069389-38.2023.8.26.0000', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3354711d-4e48-50db-9940-730135861724', '1029614-61.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7c6b85b6-5e2b-5028-b22b-ba4a21545827', '0102728-48.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('30e36bbc-3d61-5f63-8410-e1853f93aa5a', '1012056-79.2022.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3016ad97-abed-5a80-8b9a-b67c4953de52', '1025797-86.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8a72db5a-161b-5e3f-8f07-81e4cba144d7', '0115006-81.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2b3b14a6-5ea1-5b96-b651-67764a12b42d', '1025814-25.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0e18111b-7578-5792-8d68-18bcbdd7bad8', '1002206-71.2022.8.26.0010', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9bb98aa8-42e3-552d-b42a-2f1d5dccd756', '1040644-90.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bd2ef4f2-9c4b-5c97-bb6b-b23829c709c0', '1040666-51.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7680b573-8bd8-5a60-a4d9-e25b85104d37', '1041089-11.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bc4b0510-4376-5eea-9d5b-ec209d457bba', '1010082-56.2022.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('20a439c1-46fd-5e22-86f6-59e85451147b', '1003394-48.2022.8.26.0609', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d9c5402d-b214-5af4-b2f0-29d23e782dcd', '1010098-10.2022.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cf8b2c27-402f-53d2-b425-8253d94b7b6b', '0117540-95.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a14fde6a-a77f-5280-8632-ebbf237b64cf', '1004889-93.2022.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d7ca7a1e-e637-5c2c-94e5-1a1222c38eab', '1041254-58.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('514e5b59-8d7f-5cfd-b05b-7a6ecc887f88', '1001158-11.2022.8.26.0323', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('43fc3a98-9f57-5b8b-a353-9ad1c80f45f3', '1008391-43.2022.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1e04a3c8-c4d3-5de8-b3b7-9c04307b9cf1', '1003878-76.2022.8.26.0152', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bc048394-ea7a-5445-a550-42d1cde92dff', '1003511-17.2022.8.26.0099', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4124a4af-b7be-5436-9cc6-29efc1e6a5d4', '1045815-28.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4ac909f5-0556-5618-b31d-4766ff4f65de', '1010485-67.2022.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1b815c0c-ca98-596a-91dc-73ce9d919e04', '1005719-17.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('66df8daf-8fd8-5f70-8931-8ce2417cf641', '1005722-69.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('98b73013-8fa9-584b-a95c-7bb391a915b5', '1011641-56.2022.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e430f2fc-a949-55f1-99b2-8276d34fb0b4', '1005912-68.2022.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('906a3646-be2c-56c3-ab50-1f80b76586fb', '0007587-98.2022.8.19.0066', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7550de3c-fe0c-5dc9-9120-5c51e76c1fe2', '1001389-74.2022.8.26.0505', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0f8d8682-9055-5fd7-8d3a-305fb65dc1cf', '1019306-18.2022.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e7bbad43-8460-52f0-8df3-ad106e83c426', '2243195-51.2022.8.26.0000', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d2caa852-3455-5e5a-85c8-0729078c5e11', '1000893-43.2022.8.26.0150', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('496124a0-d445-524c-9c16-b01dbf8f2deb', '1007770-51.2022.8.26.0068', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('434feb34-6321-50e7-9b45-732ca9aa1720', '1009754-67.2022.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fb4e98fc-9a9f-5995-ba03-c1d40f0710cd', '5005869-16.2022.8.21.0004', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('19bc33f5-354f-5877-a9b5-9db47e15d425', '1029450-96.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9ad05bb9-bafd-58b1-ab76-3da5aa547e64', '1003930-74.2022.8.26.0604', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b2103fde-860b-5bd3-ae8b-5496a08f3f7b', '1011787-97.2022.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('68395842-58db-5b25-a5b3-35280cc4965c', '1046515-04.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4c6d9557-2ce0-530c-a795-6741fe8a460d', '1001388-25.2022.8.26.0106', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2e23229a-37b7-552d-a4d1-781fe83de418', '1004262-17.2022.8.26.0127', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6bcdf73f-6f45-55b9-bc22-99df39234d83', '1011115-95.2022.8.26.0562', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8c6b4e07-0769-5fcd-9b71-45938d6e0cba', '5010309-23.2022.8.24.0020', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('46a9a708-1a2b-59df-8cf6-5e03630e9806', '1004208-75.2022.8.26.0604', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b9925b65-fccb-5fb1-923c-e155eafca15d', '1005231-47.2022.8.26.0510', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f2dcdb95-c2fc-5362-b37d-ac5fa584544a', '1009736-44.2022.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('070cd05d-ed50-5e6e-9e97-150c65445751', '1012553-81.2022.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('32ffdfca-9bc8-5716-826b-1cdaa9bc7c63', '1010482-11.2022.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c39419ad-35ec-5f0d-a085-392d0a01e602', '0128255-02.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5aad23f7-1459-56a0-9b1c-e1b4f2469797', '1012412-56.2022.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a0bf509d-c329-57af-aeb8-a645bfa0f07f', '0008415-14.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1b1e2f25-a9d7-57e5-a83e-1334fe93194c', '1010484-78.2022.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f936830b-db0e-5150-92e7-060abfa50672', '1017846-84.2022.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a0f2f979-634d-58ba-b9cd-e950fb855829', '1002274-44.2022.8.26.0358', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8921c788-2ddd-5a67-b666-ea25b907e18d', '1002164-68.2022.8.26.0318', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('eac5bdf8-9a03-5b1e-9fed-f85fb5fe7a15', '0001252-20.2024.8.26.0318', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('388ddfff-6428-5b8b-8440-70afd8f8a1e0', '1007464-19.2022.8.26.0477', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3fc4dee2-2858-5399-95f8-61e996825260', '1005378-53.2022.8.26.0161', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('03104d7a-fb2c-545e-97ea-fa78de1d4db9', '0128818-93.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c3217406-6914-5779-93c8-ad820fbd523a', '1049493-51.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2bc4022c-005d-5dda-b3e6-5c3492ad415f', '1006936-68.2022.8.26.0223', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8c4b8e29-1874-59b2-add0-eb793df60b7b', '1004494-14.2022.8.26.0132', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b3cc36e4-3e90-5d02-a503-edbc332b0114', '1003498-46.2022.8.26.0704', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d86604bc-7672-59de-b129-677b907f6aa4', '1004158-12.2022.8.26.0099', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2b75d783-3e1c-53a9-b52b-f1c02be21cd4', '1006244-96.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('42aa26bb-c463-5166-a78c-0ad4e10fdf53', '1004252-94.2022.8.26.0604', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f3ededb9-1cb1-50ea-8aae-451a2c122a6a', '1049867-67.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d0009121-0c03-54a4-a082-9caf1c3470b2', '5003786-03.2022.8.24.0082', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ab6b7a6e-de76-5f3f-b3de-a1495c4eb450', '1012189-18.2022.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('11f493a0-e6f6-5693-89f2-70230b9a00ca', '0128887-28.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('50f6e6b0-ec3c-5beb-87dd-90b51788e994', '1004169-41.2022.8.26.0099', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('25f96e00-cb06-58bb-a151-e26acd72e0dd', '1031838-69.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fc25890e-4c5c-5157-bcb4-8aadbb2355dd', '1014720-83.2022.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('38160740-6695-54dd-8541-15cf5d29bd66', '1020891-08.2022.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e6d041c9-4851-5231-b668-e81a0f41146d', '1012561-52.2022.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('46b29644-fd6d-5f7b-bb59-fbc25b319866', '1049968-07.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3fdaa2fe-4a6d-584d-8546-9aee91ef9575', '1008950-20.2022.8.26.0451', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('62699c51-14d8-54d5-a1c7-66d64bd937a4', '1006262-20.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2c9d56a5-2b20-586f-be36-b3f305b826a9', '1007111-40.2022.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cc91849c-745e-5b9a-b9f7-84c0237484b8', '1033921-58.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('41be67f0-b258-5dc3-bf20-8a0f3efe1afd', '0007111-35.2022.8.19.0042', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('489f018c-635a-5ad5-86d3-b27736e04056', '1012986-49.2022.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a613421e-1b73-5b4e-9ad7-dfc9f4e35d52', '0141772-74.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('13e7df61-565d-5836-98b5-fcbd2c373fc9', '5010964-91.2022.8.21.0015', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0e41fe86-48e2-5a1c-8a14-7829500b39f1', '5015803-41.2022.8.21.0022', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('881049e6-4f1a-5f2a-b113-77d34dc6c748', '5089263-27.2022.8.21.0001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9e1497f0-1083-53a3-9bc2-7022bf49d0fa', '0779464-75.2022.8.04.0001', 'TJAM')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6bd01fe9-45a6-5ba0-b827-84f2939dc869', '1052894-58.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('07168e12-af35-5227-94ba-770cb225c2f1', '0135214-86.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e5b2b59c-68ce-56d2-8760-15e2ada05e12', '1003616-50.2022.8.26.0048', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('78e8f2a0-2f45-50be-9fb8-e0b8285f3346', '1001937-34.2022.8.26.0462', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4e80ac70-cf99-517b-a60d-f6d1895628de', '1033774-32.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('83464c13-d2d0-5726-b25e-c31afcc4c46a', '1006255-70.2022.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('36cf0e4a-1305-5f5c-ad80-351d03a14f9c', '1013305-47.2022.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4ce7df33-8338-5017-b87c-db559300a54c', '0802810-85.2025.8.19.0210', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0c75c35b-41cf-5c22-bbf0-4eb275b5dd1c', '0003810-03.2022.8.19.0003', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9c17b083-b2f6-5b8d-be4e-290892de4872', '1001592-69.2022.8.26.0106', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3b1b82c1-4cbd-5b1f-91f0-9d5a90b79c7e', '1002542-12.2022.8.26.0322', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4fb49eb9-6fcd-5b2c-b49d-34c489b6e23b', '1026718-69.2022.8.26.0576', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6f87772f-7d56-5705-8bcf-e0d3a4787bba', '1004892-95.2022.8.26.0152', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ea708ccd-8eac-5ab2-ac6d-4a2409f18be2', '1011280-69.2022.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cc7dda1c-6b06-5da8-8877-25225d09f3f3', '1022255-15.2022.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d0e0df5d-38dc-5148-9cf4-5644280bab66', '1004893-80.2022.8.26.0152', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1f379187-b00b-5b3e-a8be-203357a23fff', '1002616-34.2022.8.26.0268', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c3952a0f-268e-5c46-8f29-7b68f7679592', '0006878-43.2022.8.19.0202', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('63b8e63b-923c-5bbe-a7a8-b7f7b98989c3', '1003688-09.2022.8.26.0704', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('025f7df5-3f26-50d5-acb3-94e7b2780ae2', '1001844-75.2022.8.26.0299', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('04b719b3-093b-505c-9d89-ce4632bbd638', '1008859-12.2022.8.26.0068', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d5ad538b-6932-5d3f-a281-7b39d76975fc', '1006610-38.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bde91c08-bd85-5bfe-970a-46e41277fd07', '1020320-28.2022.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dba07ce4-187b-55fa-8b05-551643ebf346', '1022693-02.2022.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8b06636d-1509-59a8-8466-fb5cf8d76042', '5036462-28.2022.8.08.0024', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('efa704d3-ae2d-57a8-99d7-42268b79f942', '5005206-62.2022.8.21.0038', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b50f41c2-8496-56b4-b8e8-f103e8d9e48d', '1022695-69.2022.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b0169902-a4dc-533c-aaea-9f3bdf7d9bd0', '1013763-34.2022.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e4aa036a-1cec-5917-9644-ee7f91c4c66f', '1002446-35.2022.8.26.0568', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f56ad0ad-f7ad-5721-aa3e-9c0906ebde1f', '1003716-15.2022.8.26.0271', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a2eb9162-720e-5133-8596-a059e5fc7e04', '1013315-09.2022.8.26.0196', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6b4d94fa-3a00-54d9-9349-87739b2ff4ab', '1006251-24.2022.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('06028b94-c35b-5ff4-bd88-31482cc472fd', '1006226-40.2022.8.26.0161', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3c3cfe4c-5d89-51a7-922a-1890051be5ea', '1004357-79.2022.8.26.0278', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0929b87e-eab4-5ab6-ab34-992fa0a7eef7', '1007571-27.2022.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('84abffa4-58ce-5ff1-9881-3767211aa1e4', '0009797-96.2022.8.19.0204', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b47310dd-d027-592c-81ca-9182ee9d5cb7', '1006262-06.2022.8.26.0348', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7a92bf14-e23d-521c-b81c-04c9cc7f5577', '1023585-47.2022.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4efe85bb-61f1-5d55-8f8a-e8e576e5a7f9', '1023590-69.2022.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a634dec0-ac3a-56da-aaa7-f1d4937b7ae8', '1007899-76.2022.8.26.0223', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7dd98d2e-372c-5853-8f6c-4b897bcf4fb2', '1011873-05.2022.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a2ac6502-544d-5de3-88ad-6ddf96252f51', '1005327-47.2022.8.26.0127', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e6d8715e-74c5-59a0-9353-f8fd30e1c3cd', '1010190-23.2022.8.26.0361', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d72e9f2a-9071-51d2-991e-6432811a8758', '5013903-06.2022.8.24.0033', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0c9f7353-969e-5196-a9a4-d8bfd08eaba0', '5004361-11.2022.8.24.0082', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('20d2666d-9bbb-5483-86ac-d89e4fcbf215', '5005131-44.2022.8.24.0004', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('585f8669-2a5f-5a5b-91b4-cfce02f94542', '1056699-19.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('32a38187-ec5e-5e86-8a33-f34df742c621', '1036407-16.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e0923981-0758-50d3-9f7c-61a1562513f5', '5002775-76.2022.8.21.1001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('81dc153e-67d5-5745-8261-e4edb865db0f', '5015559-17.2022.8.21.0086', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c9dbe0b4-43ea-55bf-bb26-2c6a2f422347', '0003490-68.2022.8.16.0024', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('796e4695-1c03-54a3-947f-fea450efd0b4', '0016384-25.2022.8.19.0014', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c3af78c6-2d1d-5b4a-8921-d0ca704bf228', '1002971-97.2022.8.26.0024', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4f6a9fe3-03e7-5bec-92bc-94c150a173fd', '1015255-69.2022.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ab3d73df-c879-5580-900d-ca8846ff26c5', '1037487-15.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0cb0fbb2-818b-5c52-9863-4686e6e63320', '1024016-69.2022.8.26.0506', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('93056bcc-4bae-55ad-9601-7fe5aea7a7c9', '1006911-27.2022.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f7a72de3-b993-56c5-96a1-88bbdd2e3cc3', '1058758-77.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7196b1cc-d5c7-5d18-977f-a54f0aab9319', '1006950-24.2022.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4066dece-486a-52a6-93fc-e1d3f8479ce3', '1024680-15.2022.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5e58e9c7-f844-5ac4-9d34-050c71f28d92', '1010566-09.2022.8.26.0361', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ccf949c8-e66a-5325-8c15-f8dae8657f0b', '5028140-83.2022.8.08.0035', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d87ef97b-8a4c-5d74-a8ba-469dcd519350', '5011292-22.2022.8.13.0313', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('953b0a99-5df7-5e41-9df3-0a4afb9d761a', '1024148-02.2022.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2c1babde-8eed-5317-a45a-4429122dfcd1', '1058860-02.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a136e787-a25c-5155-8c25-b99e407772ce', '5004423-22.2022.8.21.5001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('43760b70-831a-5eed-a12b-4e223908224f', '5115071-84.2022.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('88a81867-7b59-571f-aa58-52a6f7b841f7', '5026360-69.2022.8.08.0048', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8d248b11-5914-5530-b82c-2e5df8b3fdf7', '0004027-52.2022.8.16.0028', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d9b69d52-d8cd-51c7-ade2-756c84ead015', '0747843-76.2022.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ad72f1ed-ca92-5694-8c24-bf10f5e4309a', '5004385-41.2022.8.13.0342', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('de3ddc08-d488-58e1-a10c-84e8f8ada265', '5013366-12.2023.8.13.0702', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6c0a1d24-c7c7-532d-ad76-7c351e3ad256', '5116927-83.2022.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c2aad415-3bdb-5bc8-8e43-58a58b01c5b7', '1037772-08.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fb32cdff-213c-5d0a-8fa9-7ae079ab1143', '1001003-33.2022.8.26.0153', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('80bf5ab7-bd57-533b-81f7-8cdb5d1c295a', '1000798-67.2023.8.26.0153', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0da0497c-1ea8-5742-ae02-d8c825490d2f', '1001736-57.2022.8.26.0360', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ffb8bdf9-9dc2-5d1b-b326-66b2e312bccb', '1009528-76.2022.8.26.0032', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bd73936f-5d08-5976-90a8-9e170b69ce0f', '1037819-79.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8dd79193-a3b4-5a6c-8545-0c4e4be63bff', '1039503-39.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('684d7401-a88c-52c5-a7dd-0594d8dc72d1', '1025507-14.2022.8.26.0506', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('90be2af1-eb99-56e1-8cf0-923ba9f72d3d', '0018934-29.2022.8.19.0002', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5ac30a97-935c-5dd2-b15d-271e775e987a', '1011046-08.2022.8.26.0451', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c57b82dd-adc2-5b5d-9d81-bc386f36be2a', '1014624-52.2022.8.26.0071', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a6217aec-b8e7-5e11-825f-4ebf4ecd1ce1', '1012878-62.2022.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fe019726-fd21-56e8-aba2-439d20f96535', '1003894-55.2022.8.26.0176', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('823395ac-417e-5097-b44c-b5d69f3ba8f1', '1000957-92.2022.8.26.0040', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a3016202-eda6-56c7-999e-b4317ff65d19', '1000820-41.2022.8.26.0160', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c88f69b2-87be-5344-80d5-3c2ab9e386a4', '1007744-03.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('33ad93b3-7580-5595-b499-538cd7f5c96c', '1002277-32.2022.8.26.0347', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3b76d8f6-9fb7-52c9-9932-7f33d6ed69a4', '5122851-75.2022.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('57a3964c-9b17-531f-b055-cf3b96e684fd', '0012013-90.2022.8.16.0017', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7664243a-6248-526e-97bb-3468066e9591', '0009016-80.2022.8.16.0035', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6831ef8b-0054-58ed-84a8-7be2fc702f6f', '0014042-64.2022.8.16.0001', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a91235ff-3c94-52ba-aef7-a47e2eb809c3', '0818817-35.2022.8.20.5124', 'TJRN')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1cb6643f-f71a-531d-a7c9-6a7fe72cd634', '1006094-85.2022.8.26.0127', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9568a5f0-17e5-5cff-b336-4c31496f4ce9', '1017338-58.2022.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('53f51998-4856-5d09-bd65-356cca032192', '1014182-92.2022.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('30995d0f-4c66-55ca-b4d3-d87748c75c63', '0004597-26.2022.8.16.0129', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('428d6622-d9aa-5d46-9eff-55a752030d7a', '0007046-53.2022.8.16.0194', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f3e2e8c0-48f6-5c8a-9992-5ccbf7feb227', '0748376-35.2022.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bf546715-d7fd-50e2-a7c3-46868d48abe8', '0748382-42.2022.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a16af57a-4a7f-5925-b3cc-59d4a7f82aaa', '1006927-06.2022.8.26.0127', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1535bbf7-18a9-5e4d-b8d1-3ed47619fb48', '0016800-11.2022.8.19.0008', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9c85efbe-5508-5918-b619-962ae5d2630f', '1048202-19.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9a7e265d-2a7f-5122-874b-88c2fe260ce6', '1048523-54.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e0954836-bb20-5c0f-9c0e-985ea61cd4b0', '1008480-54.2022.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a4bb26cb-ba83-52b2-a713-e613d7a40fa4', '1018761-45.2022.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('63530889-efc1-5267-bcf9-2ca9e826ae5d', '1015076-66.2022.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e5f24df3-61f3-5f09-8135-606c070b2bb4', '1050155-18.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7deae8a2-11df-5205-a3ab-3f67af455458', '1005643-24.2022.8.26.0624', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d73fb6b9-cdfe-598e-91f5-cb44c35bfba0', '1002565-90.2022.8.26.0666', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('789336cc-e0ca-5f20-838a-a1a67adb4911', '1000593-17.2024.8.26.0666', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6c5f1cc4-f6d4-5765-8628-b0cc2ac377ee', '1019781-04.2022.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('da18831e-6d19-5854-867e-92bc6a3623df', '1019793-18.2022.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bf7b0fe8-bc59-514a-8931-2abf266ba0ca', '0003749-43.2022.8.19.0036', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3f9877b9-168c-5e28-9c3f-d002f903a549', '0807270-26.2023.8.19.0036', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('050b8c01-8691-5cf8-8763-515da593484c', '1005144-22.2022.8.26.0533', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1fb48804-1c5a-5cd4-898d-db03b7c0ece9', '0856913-06.2022.8.14.0301', 'TJPA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d6c1f234-d739-5abf-a9a9-8f68b95f7c70', '5122656-40.2022.8.21.0001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0dd0f016-45f0-500a-ae8f-afc145435b8c', '5009627-34.2022.8.21.0026', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('78cfcbdd-e905-5d25-a8e6-a835aac98abe', '0003992-69.2022.8.16.0165', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e7b7a182-034c-592a-b703-3d0db1389a9d', '1002533-25.2022.8.26.0201', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('239924a9-64f7-5adc-abd7-82f6d2d852a1', '5033420-79.2022.8.24.0038', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b1cfdccc-f88b-5783-9ed7-4d107a6d1b14', '0016204-24.2022.8.19.0203', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ec0443a1-3114-56d3-b78a-16024a17816e', '1013163-65.2022.8.26.0032', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c672c25a-971a-59aa-bee5-dcddb7473f72', '1002983-58.2022.8.26.0462', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0c90a529-ff0c-5ab6-bb80-54a6dfa63633', '1002928-14.2022.8.26.0299', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4ebf624c-0056-5e4a-a441-0f6dc0e40375', '0030255-61.2022.8.19.0002', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('497ece84-e07a-5107-929b-5f81032e0bd9', '1082440-61.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ec537565-c57c-5e15-b978-e42ad8ee8752', '1005362-50.2022.8.26.0533', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('39d01f71-4c0b-5a51-aae0-2842e05af6f8', '1002717-39.2022.8.26.0505', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('89cb0dea-2eb1-54b2-ae06-e74b2a3170c2', '1020931-87.2022.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('54366cfc-3191-5ffc-afb3-756583c2f09d', '1007818-27.2022.8.26.0127', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d1241f84-eee9-5d58-9b11-8093656ee49b', '0017703-51.2022.8.16.0001', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3a7dd29f-8e41-5964-936e-9a780ddada58', '5169721-81.2022.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5b427021-a819-53c1-b314-f204c798c209', '5036566-07.2022.8.13.0145', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c9fafab6-36df-589e-aec1-b6bca9c5aa4d', '5012712-84.2022.8.24.0045', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1774848d-789f-58ab-ac84-c6ad09dba951', '0726876-48.2022.8.02.0001', 'TJAL')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b121ba5d-fc95-534f-b3ac-c81f2a366a80', '0747851-53.2022.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ab350dcc-586a-5708-8504-9dc551be497c', '0747864-52.2022.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('03addf32-64aa-5ec5-abaa-c98346b70331', '1018097-56.2022.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('be57add6-4a50-5ef5-b7ca-ed204610f91b', '1022263-22.2022.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ec42d048-c86b-5329-b731-0cb26ea03462', '1022270-14.2022.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('55645a0e-78b4-52b9-9278-280c6fae1166', '1056080-92.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b642266e-ccb1-550e-a14f-9524afb8c3ba', '5144518-67.2022.8.21.0001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('935bbe40-ddd6-5d91-88f7-f0be9c22211f', '0005694-23.2022.8.16.0174', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('474e361d-c3bb-5b08-a7f0-d70b0750ce9a', '1010082-80.2022.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('18942873-e8e8-58b9-a56a-06ae520a5ef6', '0747874-96.2022.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('66d54912-9b64-549a-ad8d-d999db05b2ae', '0049600-58.2022.8.16.0014', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c1115cdf-6ec4-5b8b-8afb-7f93e380001c', '0005322-09.2022.8.16.0034', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('59664fc2-7e76-5436-a3b8-33994043ee00', '0027496-51.2022.8.16.0021', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b5c31897-4f6a-52a3-9dde-5eda4a72760c', '0816538-72.2022.8.14.0006', 'TJPA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a4499d90-71b1-55ac-a936-8a3fad0e6ed0', '1008659-22.2022.8.26.0127', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e3d64376-46ac-5801-bf87-e5fcf00f277b', '1027838-29.2022.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c24aca37-2299-5886-b4b5-bcadae44af5b', '1003649-65.2022.8.26.0363', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a8e3b122-7a3b-56b6-abfc-b522eeb05243', '1023839-50.2022.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('73001a10-3e14-5ff2-b2e3-924993eae675', '1019370-70.2022.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('55fdfccb-c3c7-524c-9e31-8170ab88e965', '1060092-52.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f3b82030-5811-5ff5-9542-5febaaeb93e7', '1038573-61.2022.8.26.0506', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('93e44f5d-b160-580b-8ec0-9fcc798089af', '1023459-94.2022.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7df29b69-e5f4-5196-96ff-23fb0615907c', '1094631-41.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('61e3b732-a7d0-5efd-9cef-03c36d5902fe', '1060587-96.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7f769b01-734e-5e2f-83ae-6c4061758267', '1000792-18.2022.8.26.0146', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('77aa51b4-9484-5715-b877-47126e62fa3e', '5028153-82.2022.8.08.0035', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('098ac685-b0ae-52ba-999b-3afbe3a6a167', '1001220-75.2022.8.26.0315', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7a444f6e-e66b-5b94-82ef-a1e61b6c108e', '1096207-69.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5c9b15e8-1fe7-59eb-9c5a-017a190bb61b', '1096219-83.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('42b943b9-8131-5289-ad9d-74b68eb45299', '0820956-88.2022.8.19.0208', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a5979ffc-73e2-51a7-beb7-42f77fa0456f', '1041974-41.2022.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5ea5d99f-99d1-5a8a-8169-d0df9190ca59', '1008031-18.2022.8.26.0229', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5cfbd185-8aa8-575d-ad66-cf30f2cdb741', '1028662-85.2022.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4a77f748-8812-5922-ba8c-4f1cdc01bf1a', '1020869-85.2022.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ad11081c-3fc7-5428-92d3-708572ba1fbf', '1012167-06.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f1ad62ff-7dd9-518b-905c-05dc4cbe614e', '0010371-36.2022.8.16.0194', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a95bc80d-9ff7-542d-9228-d008ed62bef6', '0009771-87.2022.8.16.0170', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('247cf015-b5a1-5ecb-aae8-c995599a2bfb', '5004732-92.2023.8.08.0014', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('75bc4dd1-3971-51b0-b680-1292f7257fbb', '5023362-58.2022.8.21.0019', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('155eccdc-d010-54da-bd86-a1367092e459', '1025347-31.2022.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('07b11620-795c-5108-bc1b-23c15f25cf40', '1063996-80.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e89a6370-a7e0-5b91-ac61-3c6fb4ae082e', '1006987-91.2022.8.26.0704', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8a5808b6-003a-5940-8f23-9af0df62d5cd', '1002883-55.2022.8.26.0575', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ca816d75-182f-5516-9f84-d95e46f8ca39', '1029668-30.2022.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a9a323e0-c13d-50ab-91f1-d5f37f1aab11', '1064061-75.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('afc413e8-5bb7-5e82-b5d5-abdbaa072c43', '1008727-93.2022.8.26.0604', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('45e81c0c-cf7a-57b7-bab8-1ebcc61acc1f', '1013279-46.2022.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0b72fd76-3449-588b-86fe-45128d18833d', '1005026-21.2022.8.26.0024', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c538ecbd-a186-52d0-ae5c-ca1132fa30a7', '0038033-82.2022.8.19.0002', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a2e0e911-be83-5694-a057-7091fd5add1b', '1013410-82.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('545572dd-d04b-5a02-91b8-fef19479fdb7', '1005531-56.2022.8.26.0268', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c144356a-af4c-53cc-b90e-b11c8f991b15', '1009251-75.2022.8.26.0609', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ecb837f1-9b01-533e-89de-ddc11fde7b7d', '1003826-27.2022.8.26.0299', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ed290673-4eae-58a2-86f0-d043ea6fa498', '1014549-20.2022.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ace07e02-cccb-501b-bc05-d4d5d4f7e5dc', '0005235-96.2024.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('89495f7d-6b52-50e7-8415-dd820782ca5b', '1031465-41.2022.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('345a82ff-dbaf-5f58-80b7-9c00099b64a1', '1068313-24.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d7e51541-9612-5ea3-8ce5-cc7ce28a83a4', '1046264-02.2022.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('11bc3b1e-992d-56c7-96fe-70d38834154c', '1031492-24.2022.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c76a5430-3dd9-544e-bba2-983e4159b8bc', '0266764-10.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b7d4143e-a934-5e74-a8fd-02f45bcf1818', '5009942-82.2022.8.21.6001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d2ad7de0-5464-5ef0-a9c3-e2fc04b815af', '0881305-10.2022.8.14.0301', 'TJPA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0058b871-5eff-5c85-8473-777cae25c8dd', '5107691-07.2022.8.24.0023', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('31fc3fe5-6220-5c52-a321-44f21cbc9d91', '1073132-04.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2434e73a-74ef-5185-b697-99567060d8b6', '0017189-48.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('394618f1-dcb7-5bdc-93b3-8a29d120a4eb', '1058035-85.2022.8.26.0576', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ee56517b-6ea6-5779-913f-d063bca98493', '1114373-52.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c3ce0887-f610-5845-9382-b9d84a3b67bb', '1022603-69.2022.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2314d070-8086-5c59-b150-8126777a37f5', '1005202-81.2022.8.26.0191', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('56c17d67-a100-5bc8-90ca-280b218ae552', '1013433-90.2022.8.26.0161', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cf016641-83e2-53c4-9dde-121f43d60e2b', '1048225-17.2022.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cb6a43f0-c20f-5a01-81d4-84de0db0dfed', '0014166-49.2024.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a90b72aa-18d7-50c1-86ef-83d787389ad2', '1114486-06.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('64fb813d-6c2f-5081-a2b7-95dc85447e46', '1004084-37.2022.8.26.0299', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5c56629b-620f-53f0-9eae-9570f234f251', '1014458-76.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d58d87c6-c897-51f9-8034-30821021df94', '1012570-08.2022.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('31f4ca8b-5609-507f-b665-6f0ca516e526', '1024668-39.2022.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('23114a84-ebab-50fb-b7bd-7f30bcf63e8b', '1001585-70.2022.8.26.0464', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c31185d4-f408-5777-b5d1-92b8459c7361', '1003166-20.2022.8.26.0659', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6eefb371-0373-5cf9-8e9c-77ce5336cc10', '1012576-18.2022.8.26.0590', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e6ba2231-c3b5-5244-9bfb-6aef1beb8c09', '2013998-98.2023.8.26.0000', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('96522917-9c7d-5a5f-8d01-5a1b35516fe5', '1029280-12.2022.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a9d53658-2e3d-5c88-82be-bfe2ed5a6251', '1010441-64.2022.8.26.0127', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ba89311c-a7e9-5939-8b79-a9ac799e23e8', '0015166-77.2022.8.19.0202', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4f55604c-d36d-5aaf-ab05-9ecadf20b5b9', '0015168-47.2022.8.19.0202', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('31706de4-9e95-59c8-8f0e-709043312340', '0040962-88.2022.8.19.0002', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('762ebdcc-3b83-5107-b0ee-2b0b48f75198', '0830560-88.2022.8.19.0203', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('aec233e3-a6fa-5e0b-81c8-e50b45ac1bea', '0826762-16.2022.8.19.0205', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3a7e196f-737a-55b6-ae63-221b1d7e23a8', '1029718-08.2022.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('00d3d4cc-c776-5105-9934-6286a335e70d', '1050531-17.2022.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bc16b55f-6e5b-5d84-8089-fe57fdfd5d2f', '1011271-52.2022.8.26.0152', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('db66b91d-8448-5b18-8083-f0d2dc89091e', '1007533-79.2022.8.26.0597', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0fb96c75-71fd-5136-a93d-de2a8c0074de', '1010086-78.2022.8.26.0604', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cf3dd16a-0da3-513a-8497-eb4d5ffd94b9', '1018230-34.2022.8.26.0477', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8d0d2a36-bf67-566e-b7ec-207f2270e51c', '1014922-03.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ce151b13-7de5-512f-95fd-ac5635b77fed', '1002215-17.2022.8.26.0274', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('757deaf8-d46b-5fa9-9cbd-e604ca5713b0', '1075503-38.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3e2e6c7a-502b-5253-82ac-1c651ca56678', '1014976-66.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e7105741-ba68-57bd-9337-c7336d1fb013', '1049745-12.2022.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f15ed23d-b9bd-5f2b-be67-5b624a7da1e9', '0830152-61.2022.8.19.0021', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c08c215d-196a-53ae-a7f6-636343c4a99d', '5191579-21.2022.8.21.0001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3ad71a4b-d182-5795-be7a-2e64e658a6d1', '5191689-20.2022.8.21.0001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1087c73f-8485-5264-ab8e-70f7f9a81a10', '5006821-02.2022.8.24.0007', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7af984ff-6fe7-58ae-a8ce-2ad796a31e89', '5023206-48.2022.8.24.0064', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a4ed3bfd-ef3d-54ea-a8fd-2e4cbf40e53e', '5009042-38.2022.8.13.0338', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8354ee6b-f3c3-5845-bd6d-f78617e29e6c', '1078787-54.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f8fc1a98-a65f-5c1d-af18-4a57a801595b', '1010041-82.2022.8.26.0278', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d36cd58b-f4f4-50f8-a2e2-27bcc1ff83bc', '1051599-41.2022.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a4f300cc-3b28-5ad8-ad4e-a5ee9eaa2c7a', '1049741-60.2022.8.26.0506', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('130d7597-a8d8-5f54-82e8-77c529449759', '1078830-88.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dfbc8e49-dc16-5899-acd3-6e16935c47f4', '1014461-73.2022.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a8bef673-0192-5119-b6b9-139741f97d4b', '1031596-95.2022.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e6dd3ec2-0ac7-5fd6-aa03-90c9d1005c66', '1016894-56.2022.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f3783a34-8503-50fa-935d-0f9287bf261e', '1016236-20.2022.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('87dd6282-0e17-53f4-98fa-fd4e3e8ccf84', '1014979-48.2022.8.26.0011', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bc30d71c-73e5-5bc1-b0dc-352006395223', '0826487-55.2022.8.19.0209', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8f3b762c-cb06-597e-bf6a-3d655626b293', '1015712-84.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0afb16c2-6a65-5420-b0f2-ec52fc33a396', '5004059-38.2022.8.21.0155', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5585c1f3-633d-54cd-9460-b3da84e4c9b8', '5003591-80.2023.8.24.0050', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ef8a3c3c-a03c-5ac4-a301-83ab5eb1e673', '5024339-87.2022.8.21.0039', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e9098f47-9636-5865-bd21-21689769e9c9', '0203603-70.2022.8.06.0071', 'TJCE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1445a3e3-aad5-5a38-8b22-2bb2f1e6d184', '1079158-18.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c797c48a-c2f1-58ab-8c8b-d4d2363922b0', '1003218-63.2022.8.26.0514', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b6de3761-056b-5753-81b5-6a5bb7456b39', '1079173-84.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1a300a26-f33c-58eb-8392-064a827deb7e', '1024507-27.2022.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8ebd0ef2-a419-592c-aca3-a415c2d5202e', '0792134-48.2022.8.04.0001', 'TJAM')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e7b64e83-7af0-54db-8e66-1f2a99ebbbee', '0792182-07.2022.8.04.0001', 'TJAM')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('334d8083-d178-557b-8695-072b96ded03d', '5197030-27.2022.8.21.0001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6836292e-40a5-5ea8-8603-baa1d427f8eb', '5025898-90.2022.8.21.0003', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('efee073a-6fef-5a80-aa39-9c9a170679c1', '5001054-42.2023.8.21.0003', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('28f0f3dd-9c51-5a3c-a4f7-8aad3067c180', '0200438-06.2022.8.06.0074', 'TJCE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d09fc29b-c4b6-5a21-8be8-c273ecd03c62', '0286999-58.2022.8.06.0001', 'TJCE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('21d8f89d-9091-595e-98da-3c9e628ff940', '0802323-91.2022.8.12.0024', 'TJMS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4f50e8f2-4b0d-5925-8f87-1d00a8ecb2e7', '0812546-72.2022.8.12.0002', 'TJMS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('de01f5a2-8e8d-5e96-bb9e-58b1210296a2', '1008847-86.2022.8.26.0362', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4f763328-1ab9-50d2-ad3e-eab7c7660cc4', '0002182-03.2024.8.26.0362', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('64d9794f-d910-591d-b708-eda5830678a8', '0200729-25.2022.8.06.0100', 'TJCE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('344c2083-c75e-5ef9-a0dd-89533f945992', '1027917-95.2022.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6c07da6c-58a3-587b-ac49-bd986209744d', '1008654-53.2022.8.26.0271', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fe847dbd-7f4a-5e6c-8b36-d44c0e8bb866', '1016505-23.2022.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fbd56625-7b85-5624-9fde-720c623d8631', '1014141-14.2022.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0af144ce-7349-54b7-9ad1-f0e98ae95672', '1007254-11.2022.8.26.0010', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5e171255-83c1-512b-84b7-2a0769543daf', '1033231-14.2022.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ec44d431-21e3-5e3e-bc6e-16a80228618f', '1032879-26.2022.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cb330c96-4edb-52ed-a37f-f91372955107', '1001569-23.2022.8.26.0301', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cb8d7987-f73f-5deb-bb7b-fb0a2fc53a39', '1004659-36.2022.8.26.0108', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5f33827d-e31d-5744-b087-926e572c5422', '1005960-28.2022.8.26.0428', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('75878cb0-206d-54aa-b426-d4ac38afbfa3', '1131973-86.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6f917ae7-f12c-5fa2-b6ed-094cd9728c1a', '1054772-73.2022.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('26c5390c-eeb6-517d-9e61-e917b28f348f', '1011311-21.2022.8.26.0609', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ecd67ca2-5825-5f1c-91fb-dd7b836dea3c', '1004809-17.2022.8.26.0108', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cb7f6a31-2b9f-5c39-8dc0-7838a9b004f4', '1023300-13.2022.8.26.0451', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6b788d22-2b6d-56ad-b527-c10d9dd06030', '1085611-29.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e63b4123-f78b-57fe-9247-685fea1f638c', '5059917-84.2022.8.13.0702', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('95f5fc8a-1ef6-5f12-88d2-f697e1da7ee2', '5015715-89.2022.8.13.0518', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('50bcd281-8b9d-520f-a6f3-a97f4f06aced', '5052743-50.2022.8.13.0079', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fed966b3-5fdd-5fd2-8bda-ae2bac71838b', '2159277-78.2023.8.13.0000', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e4b50d8b-8d35-57c7-8f07-1db4a24833a3', '1004708-86.2022.8.26.0299', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fd4b9dfe-5499-5adf-9d2e-0dd0214ec38b', '1022540-05.2022.8.26.0309', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('06b14f85-1c75-501f-845a-59288bcec146', '1034244-18.2022.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c378513d-48d4-52d7-80a8-4ec467362dad', '1012520-34.2022.8.26.0606', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fe81a708-c8c0-556f-b652-32e798c6f968', '1086143-03.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5fc5ef63-4a7a-568e-b617-9467f4c5fd49', '1026688-98.2022.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f02840dc-e3c4-5568-b11c-75866213e94a', '1010931-21.2022.8.26.0278', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ffb69b49-1150-537b-9416-2d6c27a0d480', '1034284-97.2022.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('47d997c5-d421-5352-af98-ca07ec5b0e7c', '1026788-53.2022.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('46192387-eb5a-5404-a66d-3e38d5e037d3', '0005167-46.2024.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a2c190df-aa9f-5c7c-900d-56a69f718dad', '1032407-39.2022.8.26.0562', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('67e8c01b-3ae8-5c45-89ec-92427d9fb74b', '0019324-78.2022.8.16.0035', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ecc17ded-5866-5dd0-8989-5f47c05b6315', '0009868-10.2022.8.16.0131', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2efccf6c-5590-56eb-83e1-7e3f44244891', '5009237-63.2022.8.08.0014', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8a8437f6-6af0-546f-b9ce-85dd0024818a', '5030433-26.2022.8.21.0015', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('76505ac0-2f53-5cbb-87e0-8099692a32fa', '5007292-53.2022.8.21.0087', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('43298ff2-60d1-5846-9b57-7c3a5c84bc52', '0801308-19.2022.8.20.5148', 'TJRN')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3834e18e-197a-5144-a8fe-04b0d62ae976', '1009019-98.2022.8.26.0565', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cbb4b51c-a507-5588-bfa5-44d6c4bb0f4f', '0820460-65.2022.8.19.0206', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('063c943a-4d17-57cd-a0bf-1e9a091464a4', '5754099-37.2022.8.09.0051', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0332a26d-141d-551f-b1e7-d6fb5d5d1ed0', '5754282-08.2022.8.09.0051', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7d762cd9-4c18-5c43-bc01-94e8d22357d5', '5754526-34.2022.8.09.0051', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('db9e025e-54da-590a-a7c9-ae190f2c8bb5', '5754661-69.2022.8.09.0011', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8a45c9e8-55a8-5986-b705-84b76b611283', '5754828-04.2022.8.09.0006', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('96affb27-35e3-5fff-b86d-768e3472ef8d', '5754979-29.2022.8.09.0051', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8f3cdf86-6d48-5bcb-92fa-4154daf94038', '5755076-29.2022.8.09.0051', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e68d6951-4b73-54fd-8448-b0a9ae74795e', '5755141-24.2022.8.09.0051', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('90eb14c4-4779-5953-ac97-8dbcff999073', '5755168-45.2022.8.09.0006', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c89c82fd-9b1a-5fcf-bfc0-833f71bf6359', '5759709-83.2022.8.09.0051', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('81aa7266-ddc0-550c-8f66-a795393f4744', '5759808-53.2022.8.09.0051', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6ca6913f-e61f-56ba-b182-17d22587425a', '5759964-74.2022.8.09.0137', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('48fdad86-6231-552b-baa4-924c20fefe76', '1015848-90.2022.8.11.0055', 'TJMT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3c2b2cd8-3a53-554c-9f0c-0c985529ab60', '1008284-10.2022.8.11.0007', 'TJMT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e1fa777d-70d9-5a8f-86b8-a7f664fe8711', '1047279-87.2022.8.11.0041', 'TJMT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('68505b15-6625-5f64-b4e8-e68854557d2c', '8000961-79.2022.8.05.0206', 'TJBA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9f67e245-5da3-559e-b80c-2529897a463b', '1035985-93.2022.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('90a93c9d-835c-5c1d-9748-54315b798f28', '0006786-72.2024.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('edd17250-f280-5625-9ce6-3dd612ff6ac5', '1009044-17.2022.8.26.0176', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7a8cf867-1acf-5a05-b603-9073f09d76ce', '1016381-26.2022.8.26.0348', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c73b0228-f2b3-57f3-a66d-59ab262d8264', '1019432-10.2022.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2bfed566-de4b-5f17-a16b-e70efafc8048', '1030593-16.2022.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('07d7210a-fdc7-5825-a519-1693cb1452cf', '1015260-77.2022.8.26.0019', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('18eb09c2-468b-5ccb-8ed2-c4c198ac6348', '1004480-97.2022.8.26.0045', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f8cbecb8-13a9-58ae-bdfe-def4a42bcf20', '1019435-62.2022.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9af1828f-38dc-596a-a8f5-03929a3a821e', '1143004-06.2022.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9cbfb897-2bc5-53e6-ad8a-52ec2dd42b2b', '1018748-73.2022.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1e1fb6d3-3cb2-59fa-8a7d-e6e8dba2f64b', '1060202-64.2022.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7dfcc7ac-eebc-5269-9f4d-279655a71e3a', '1091020-83.2022.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2145e4f9-61c6-5c9e-9ff7-b24c77017db3', '1028141-31.2022.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('002ce972-bd0d-57d6-85b4-d77506c7b221', '1014415-37.2022.8.26.0248', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('037e15d3-2b18-5919-90f6-218a042b229e', '1007207-33.2022.8.26.0270', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('76682a61-ba21-5b68-bad2-82c970c88769', '1058730-67.2022.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('623a2993-e6e4-5dad-a165-e7d1e85c56ef', '5051556-95.2022.8.21.0010', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4c53d43f-6111-5c3f-8466-633b0484970b', '5008445-65.2022.8.21.0041', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0a906106-cca4-50d1-9ce8-192b82b549c2', '0059781-45.2022.8.17.2810', 'TJPE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a10348dc-969d-5079-99ee-9150929a92fd', '0169051-06.2022.8.17.2001', 'TJPE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f5c345cb-d94a-5d7b-bfe6-be34bf2dafec', '0169058-95.2022.8.17.2001', 'TJPE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f37e8b45-0118-573f-a676-47f2bfbbad9a', '0020193-51.2022.8.17.2480', 'TJPE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fcab62ce-02dc-5249-8860-3eff94d9b811', '0005077-14.2022.8.17.3350', 'TJPE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('be9e4c4c-463c-5f57-b34a-522098f98c24', '0017079-46.2022.8.17.2370', 'TJPE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a20a0436-5aaf-5093-bbb9-95b5df335bbe', '0169298-84.2022.8.17.2001', 'TJPE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0760ebd5-d592-50f0-8eb3-bcb6a54bc9cf', '0858835-66.2022.8.12.0001', 'TJMS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7ef638a3-4ec0-5c33-89ee-ef6d10bdf97f', '0827872-53.2022.8.19.0204', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('409380a6-a26a-5cc0-a777-013fe20095da', '0820360-25.2022.8.19.0202', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d0a4c203-aa47-579c-9d58-15d8cb4ef9ce', '0800119-75.2023.8.19.0208', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1129af24-a3fd-5eaa-bb13-e273203a3a77', '0800161-42.2023.8.19.0203', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('050c4a1f-414b-588c-80e2-fcf278cb981c', '0800210-93.2023.8.19.0038', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('84b8a22f-a4a4-549d-9fe5-ce1d64d7126a', '0700370-60.2023.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('57c22fe9-1895-52af-a1d0-4489c04ea7ae', '0700373-15.2023.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e922121c-b320-5355-af79-9806acd98d61', '5005349-85.2023.8.09.0091', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('09e4cb70-fb8a-5dfa-b508-6a1058c5c398', '8000786-84.2023.8.05.0001', 'TJBA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5ff2eee0-82a9-5271-ba9d-56dfaed8a7ee', '0000123-71.2023.8.16.0001', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0577fbf7-fc27-5237-94b1-b0fff620df0f', '0000126-26.2023.8.16.0001', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9fd467bc-726d-5f40-9fce-26fe750e6ac4', '1000981-06.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d96e5ef5-3d44-5948-8de3-912b1e21c54a', '1000051-58.2023.8.26.0108', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3c2211c4-d4e2-5824-ab1e-e6bfeefef59a', '1000013-22.2023.8.26.0601', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('06ce073a-982a-52d2-ab32-7de715e2145d', '0000245-80.2025.8.26.0601', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('21080603-e5b6-50ad-a216-44c440008308', '1000365-91.2023.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('93c0ef02-8058-53e6-bafe-186859222851', '1000026-32.2023.8.26.0177', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6164f6a2-adb1-52ac-a3e0-549eafc6475f', '1000247-28.2023.8.26.0011', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('20ba0a53-dcbd-537e-bcda-8d5e2b4e1736', '1000217-02.2023.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8ac7dbc7-01c1-5e33-a5d1-85ba80ed95fe', '1000038-08.2023.8.26.0222', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8208f77f-aa69-5b09-8272-0abadbf0aad0', '1000162-56.2023.8.26.0362', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('50d13ea8-f29d-54be-9f18-b10110035e3c', '1000053-98.2023.8.26.0505', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f9294cca-68c6-5978-8907-bc681cfa61b3', '0800561-38.2023.8.19.0209', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d98310b9-6480-5931-aee4-a143b9f19a07', '0800534-58.2023.8.19.0208', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9e227240-1194-5203-b6bd-577ae59da9bd', '8002716-40.2023.8.05.0001', 'TJBA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9a751ad6-fcb2-5338-84a1-3dfff0a9bb24', '8000340-38.2023.8.05.0274', 'TJBA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('90f262b5-fa0c-5f77-96d9-219fd1fa7693', '8000123-06.2023.8.05.0141', 'TJBA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fe2e785a-ea42-557a-b138-03cf77486389', '0800002-69.2023.8.20.5151', 'TJRN')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1a9876aa-900b-576e-b194-9522c9ecf493', '5000021-58.2023.8.13.0611', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('801020eb-59fb-5e50-8f6e-6003fe493f5b', '1001775-67.2024.8.26.0430', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('50cf0fa8-19a9-50e0-af09-f27c521f0e32', '5003338-79.2023.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c11c9288-8acb-5b68-9820-f618bf7fee00', '5000482-94.2023.8.24.0038', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5a1ba289-1700-5880-84a0-a2ae9a3c7dee', '0801900-69.2023.8.12.0001', 'TJMS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2d05c062-bdd7-51f7-a7a7-d88eb3521600', '0002481-93.2023.8.17.2001', 'TJPE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dc8a4e08-25d1-5c9c-80a8-1c497a9df455', '8000709-32.2023.8.05.0274', 'TJBA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('21127971-eeb6-52cc-b78d-1f2cb8c08a5d', '8005543-24.2023.8.05.0001', 'TJBA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9cdea321-71d1-55bb-bed7-bea0172213d3', '1000464-86.2023.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bf9bfb78-e6f1-5129-83c0-b54e442d9e09', '1001202-79.2023.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('40e1120f-f24c-5638-9b21-1b195a817db0', '1000567-87.2023.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('54244fed-42aa-5786-b12e-9812c426835a', '1001136-61.2023.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('028feaed-e85a-5878-b940-13d52c48ed73', '1000890-06.2023.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('369c570b-b268-5dfd-bb98-6145137d33c4', '1002838-87.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6f085a86-3d67-5d3c-87d9-b1c37f10f53d', '1000429-86.2023.8.26.0278', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c7f7d7c8-a045-5df1-9fb3-920e0474b4b9', '1001455-77.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a4811ace-be2b-5ded-9d07-b11d240d83ad', '1003027-65.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('702ec949-ee19-58d7-979d-2467466c429a', '1005625-86.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0b789869-a28a-532f-8fcc-c74d3cc5e911', '1001480-90.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('34c17bff-9d35-5890-8b47-bc9aeb2e0c21', '1000136-39.2023.8.26.0045', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a3c7364a-53d8-5fb7-ac03-05806eb43fe9', '0800545-78.2023.8.19.0211', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f262eebc-b475-53e5-a5dd-d28bf3eff878', '0800546-63.2023.8.19.0211', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3325c49d-93cd-5286-9b8c-eb4883ad2864', '0801821-65.2023.8.19.0205', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b42a54f2-8ad0-52c8-b29c-e287ec9bdf5e', '5000851-69.2023.8.21.0039', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b3ac7330-6331-5d52-9201-507a6ebd7f2f', '5000964-19.2023.8.21.0008', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5b197869-1adc-5b0d-b249-159b0153dc64', '5000621-31.2023.8.13.0433', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c25e463a-53ed-596f-92a1-a3040f1c59c6', '5000493-59.2023.8.13.0223', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('04f46de7-3154-5d44-ae7b-af0fd3f5a2ae', '1000454-57.2023.8.26.0292', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2114d00b-ae55-5f33-94ac-4441892a9735', '1000563-27.2023.8.26.0533', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6e7889d9-9d72-51da-b711-9ece91d90031', '1000440-68.2023.8.26.0229', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d79566a3-90ec-52c8-a00c-e790a6965c97', '1002504-77.2023.8.26.0576', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('aa1bbe38-1d4e-5c43-ac31-e7691f04b46e', '1001507-25.2023.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ab046d52-3003-5a18-95dc-e2c8624b4770', '1006755-14.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3c9725f3-674b-57a2-82a8-45b17743ff7b', '1000619-25.2023.8.26.0286', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('11b7b2d7-7757-5a40-b9a0-f4693b35484f', '1000651-94.2023.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ee771423-a41d-5a47-a308-895310d6bee0', '1002461-32.2023.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('71c1827a-4cd0-581c-bdfc-6da70dcee219', '1002243-31.2023.8.26.0506', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b35ed365-e604-5d53-b7c2-b4fc4cb14a83', '1001243-44.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c67c2418-223f-56a7-9d6a-2858c40c176d', '1000451-62.2023.8.26.0079', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('043d6f2a-dff6-58cd-a233-ce36cfbb13b0', '1004012-34.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('17049760-3b79-5e28-9c94-6d88abf19608', '1001316-91.2023.8.26.0562', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('16c20f1a-817c-508c-a4df-6316f4c6475d', '1000721-64.2023.8.26.0248', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2ef579d2-13cd-5720-9358-1d417cb442d8', '0002340-12.2024.8.26.0248', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d13d57f0-267c-5175-9667-ed8a6bd56751', '1001580-27.2023.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('24ee46f7-8140-5cc1-acb6-ea09b6fe35b3', '1004065-15.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7ac563e5-2416-5e47-af08-398445d4b9b2', '1007513-90.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6a78203c-d555-5fc1-857b-b598f0c8f358', '0818411-87.2024.8.19.0042', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ce82f8af-638f-54ae-8919-4a8ccf3eb35c', '0001460-95.2023.8.16.0001', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a52fbf25-3355-5780-951f-d68b1e9006b9', '0000542-92.2023.8.16.0033', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('46279c6b-0def-5006-9c1f-4df4baa5ccea', '0801334-51.2023.8.14.0006', 'TJPA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b438b486-2142-5be0-8f10-fc67fe69cda7', '8009555-81.2023.8.05.0001', 'TJBA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('37be8b42-50dd-5bac-9933-2e783bb4d10e', '0801985-36.2023.8.19.0203', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('52a11aaf-b12c-5f4a-ad10-5e16affbfffe', '0802404-50.2023.8.19.0205', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('afb8601a-25a0-5099-934e-a4bc23bfa1d3', '5000600-76.2023.8.24.0036', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9f1ebf45-6c98-5483-b96b-10de2a1f8d59', '5000833-26.2023.8.13.0183', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4ad5e757-d5c5-51a2-bec9-825678a0fa03', '5001126-81.2025.8.13.0132', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('69c4ab7e-8ba3-51b5-9fc4-5f41aa730be5', '1002296-72.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('eedf87ea-7b4e-5e9b-8ad2-e768787f1572', '1002302-79.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('66f2e132-f403-5543-b475-64efb5a4478d', '1001809-84.2023.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('01b85a64-d6d7-56bb-b9d6-277983c8cb8b', '1008500-29.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('105710c7-daf8-5322-af4a-1ed6b2aefa21', '1000410-64.2023.8.26.0445', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('09936c75-e857-5699-8717-8cafe134587b', '1001124-25.2023.8.26.0477', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f7fcda20-4c4d-5bd1-b46f-2ad3f55b9bf4', '1004670-58.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e2c09645-6adc-5e32-9d12-35099e0b74ea', '1001412-36.2023.8.26.0068', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('322f6eaa-7330-5ff4-a8a3-d897dd527ea4', '1001828-98.2023.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d8af2ac1-b256-5d9a-8443-b8702f68d7b1', '1001432-80.2023.8.26.0309', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('edc6c0f3-4cce-5361-a5e7-dd4940d32feb', '1002080-71.2023.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ea5bbe59-762b-54d1-9531-2546b314eab9', '1000294-38.2023.8.26.0484', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cc0b334d-909a-5190-8481-90136b772242', '0840438-56.2025.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0b85248b-26a0-550b-ab64-42c40ba803b2', '5054112-84.2023.8.09.0005', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('beffe183-f574-5e04-9b6a-96278f49dabb', '5054186-97.2023.8.09.0051', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0861f095-c53e-59d3-9a4b-83fcf8dc5e7c', '0801723-89.2023.8.19.0202', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('665315af-32e7-5c96-bb55-4aab60d27215', '0800114-61.2023.8.19.0076', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e2bcf3b9-eac5-5541-bca1-b0a73785b070', '0801815-67.2023.8.19.0202', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3ea9669a-f2f2-5b11-8060-728730458a45', '0002045-50.2023.8.16.0001', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fe7b7709-b282-55e3-924b-94ae4cadd1aa', '0207785-81.2023.8.06.0001', 'TJCE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7d9db6d9-2a56-58ac-a170-514972782fd6', '0200219-76.2023.8.06.0035', 'TJCE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('52b56b5d-a402-5a77-8ef5-d1ca004e20d9', '0207986-73.2023.8.06.0001', 'TJCE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('68c08326-a9f8-5245-bfcd-3e81a88547e8', '5002998-04.2023.8.08.0048', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3771191e-4925-52e8-9ea3-dbc21fc70870', '0010028-87.2023.8.17.2001', 'TJPE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5c60187d-18c7-59ed-9051-fa7b868b409f', '5138273-72.2023.8.09.0087', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9486f387-20b7-56e8-8bdd-52f2c3cdf729', '0710446-46.2023.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ad561003-c6ac-5195-abb7-e6f69f115689', '0826552-58.2023.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('aff2c420-91f8-5d86-a462-a038b64ceaaf', '0826661-72.2023.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('805acbd3-dff8-5f47-a606-baf627fae871', '1003705-74.2023.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a8b166c4-05d7-54fe-8e08-668cd5d6b75c', '1001078-57.2023.8.26.0082', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('70ad6eec-4a58-5dea-9982-8cecde118d73', '1000937-84.2023.8.26.0584', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c361d0ba-ed83-584c-8dc3-2a7a779acf05', '1011831-46.2023.8.26.0576', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1f1d4f3d-6e24-5f48-afd6-edb9a0f6693d', '1006669-98.2023.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e83ff90c-35a4-5b34-a46b-f1df23c8a16f', '1007596-15.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('deb03c95-ac9d-55ca-85d3-fc9c8ca19986', '1002185-60.2023.8.26.0269', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cbf8df60-8a5e-53f8-b56b-81d927bc6e65', '1002069-04.2023.8.26.0609', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('39ca4909-9ca9-518b-ba24-218b2c8f96b1', '1005573-90.2023.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e028d1e3-09af-5611-a56d-19149aac07ee', '1000620-08.2023.8.26.0028', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0d084fbe-2cbc-557c-919d-e24d15f6c2cf', '1000738-70.2023.8.26.0452', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f264dd94-1d08-573d-a0a9-8d8da26a84d4', '1003047-44.2023.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('024dfb5b-e32e-512e-8b58-93cf35916343', '1013897-29.2023.8.26.0566', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('458f6072-6694-584b-9633-9c8142792211', '1001940-33.2023.8.26.0048', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('38b44c3d-67e9-5d6d-87ac-066f384d84f5', '1000839-92.2023.8.26.0360', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('553a052e-f818-5e49-8f42-f5af75093497', '1029139-68.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8800e2f2-2669-50a0-a42b-01ddd7b3f33d', '1001365-46.2023.8.26.0526', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8a4376f6-4624-54b5-bc38-706f58854fb4', '1001793-17.2023.8.26.0271', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7e402f05-07b8-569d-9811-9a48352ef212', '1006055-28.2023.8.26.0071', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d4a236f7-b47b-5a27-8bb7-45445085c777', '0024974-64.2023.8.17.2001', 'TJPE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('aa786e6c-0ef0-51e2-aa7f-93c582e8aa3f', '0712004-53.2023.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5f5d7543-bc99-59df-ac63-03cef688965b', '1004398-58.2023.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a1aff4a8-73eb-549c-8529-0bb87ddabbff', '1000693-77.2023.8.26.0125', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e3be96f5-3e6b-5932-8c84-73023a74e961', '0808831-63.2023.8.19.0205', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0788a41e-2324-5aef-a297-2b8411b52700', '0808911-27.2023.8.19.0205', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b88cdf65-6e50-5a8b-8d2d-66a3814949f5', '1004440-10.2023.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a519d8ef-3a50-5930-a009-2c9e4141f667', '1000947-80.2023.8.26.0115', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('aae3408b-cec0-55bb-bfce-40b466be679f', '1008019-24.2023.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('10230a54-f402-536d-a571-72fd318c1d89', '5006521-10.2023.8.24.0135', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('94188db6-eb80-53e3-b341-403e1001fd50', '1003259-59.2023.8.26.0590', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1fca40f9-d7ed-5457-bc0a-25ead153ab2f', '1013011-86.2023.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b19e1363-3b18-5e95-8f63-1e54240155f0', '1000558-30.2023.8.26.0654', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9ca82c3d-2196-54f6-8f91-3dd46809d13a', '1007717-25.2023.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('84b20f86-2327-5f09-8951-c578f8fa6aea', '1006628-76.2023.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('85795757-b0be-5f59-bc71-ee2fb30c4bfa', '1005098-36.2023.8.26.0068', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('021080f4-594e-57cd-bb7b-7393401421c5', '1002019-13.2023.8.26.0565', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ed8d1f75-b3d3-5d51-bcfc-b1674dd05189', '0006160-66.2023.8.16.0017', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b5c59e09-32eb-507c-8742-b1cf42814639', '1036759-34.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a41df463-cd05-56c9-87e0-60e174c2f21c', '1002678-10.2023.8.26.0278', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('44b1f6ca-2160-5dd6-bd18-b32fb87c372e', '1009963-12.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ff01fab8-ca4c-5436-99d1-11324ee348d8', '0809758-29.2023.8.19.0205', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('44f71f3d-0362-566f-80f1-bfc8f5850c48', '0806542-69.2023.8.19.0202', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b2502eef-8174-5990-bf73-c2c970d5dc01', '0806554-83.2023.8.19.0202', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('01716f55-41da-52a8-9424-c23173e262d7', '0713386-81.2023.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2ae65762-e762-5c9a-95fc-c44d6d83d176', '1004969-65.2023.8.26.0477', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b755b23a-222d-5747-a736-b4444e5b14c0', '1008583-33.2023.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a3394f23-842c-5e16-9e46-7d525c88d9a8', '1001041-67.2023.8.26.0296', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1b6f9429-f317-5efd-aec9-f3ab282ca180', '1004774-93.2023.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('75998db9-2e0f-573f-8f2e-a358ed7b0cb5', '1008594-62.2023.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('eacb393f-dfcb-5af9-8184-13779e4b1967', '0841656-90.2023.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2466fe6a-7c6f-5fdd-a169-b16362d8de30', '0807569-46.2023.8.19.0054', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8348ea01-2266-5135-99c3-cb7a655dcaa2', '0800814-31.2023.8.19.0078', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('370c9a4e-e257-5f79-b520-526ad6cf34b8', '1006913-63.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0c1bc034-4e15-57ce-90fd-f7c173261fe4', '1002855-57.2023.8.26.0606', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6a4ac1ae-27c4-5d7d-ae31-4ef5bc3d36d6', '1009089-76.2023.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9243329f-b0fb-56b8-a9cf-8364d0fca049', '1005876-59.2023.8.26.0309', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2c3a6f23-1e87-5454-bd85-d4c857ae119d', '1003599-50.2023.8.26.0348', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('68144b2c-eda5-56a0-8cc7-a17be2b18080', '0810993-58.2023.8.19.0002', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b3b1f16a-de65-5a92-949c-b3680f406640', '1005883-51.2023.8.26.0309', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('173028b8-8c36-5da9-99f5-c2fa7f5f2340', '0005104-41.2023.8.16.0035', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('82dd039b-478a-50f5-9fce-6b62d612bd1b', '5053796-50.2023.8.21.0001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('10c7596a-8e63-5627-a208-ae4c7305c978', '1007082-50.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('68867d61-34eb-596c-8cb8-7ce333ec9cbc', '0836601-72.2023.8.14.0301', 'TJPA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6f4b794c-0b99-58f2-8fbf-c000b5cc4935', '1003088-54.2023.8.26.0606', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('83dc610c-e70a-5cbc-9dcf-48d55a6fbd54', '1008580-62.2023.8.26.0562', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('37287985-b10a-5b4e-bfa5-576466a5fa80', '1002830-11.2023.8.26.0229', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('43f6de67-9e21-5ec8-bddf-3d269e2f6f10', '1007540-67.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b90ce0f6-8f46-55f6-b990-336b62591b97', '1003902-64.2023.8.26.0348', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e2e3ffca-f56b-589c-bb8f-29d15035d6f8', '1001829-24.2023.8.26.0024', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('65dde710-dfb2-5399-8d7b-34cd50f0efc4', '1000684-41.2023.8.26.0279', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('592636d0-65fa-5c5d-942f-cfca373b541b', '1007557-06.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('34146597-fd88-59bc-bf56-bda7d3d70e39', '1004348-54.2023.8.26.0320', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c445ce4a-e1e8-5731-af92-196cf4cf4700', '1011247-55.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5db94c44-e775-5015-961a-73221876e50e', '5055835-20.2023.8.21.0001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b3f4f420-adda-54ef-a68f-edff957e848b', '5000422-47.2023.8.13.0097', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c6752d09-954b-5bef-bf4f-a13deb95643c', '8000965-65.2023.8.05.0244', 'TJBA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d83246da-f863-5689-ab9b-4f110f003081', '0811982-37.2023.8.19.0205', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c8c7d569-e452-579a-88c4-700a6d91c415', '1004735-41.2023.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('822a92ef-7e1c-5eb1-bcc5-ea428810cfcd', '1044501-13.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('01ffe40d-b99e-5202-9908-f87d746c69b8', '5008674-31.2023.8.24.0033', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3b4b816b-b5f4-5a4d-a54f-c665e74129da', '5008670-20.2023.8.21.0019', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('04c05ffd-da6c-5d78-9fb2-7a7728017545', '1012559-66.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e8f2e225-1618-5f6d-b926-efde5ac55d49', '5076872-56.2023.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('aae4cf42-5e3e-5787-94c8-564c5ebf9fae', '5004361-93.2024.8.13.0034', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6ed0ce83-ed17-5076-b90a-cb243f68cf7f', '5009048-86.2023.8.24.0020', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b84eeb37-ad1d-5a82-a75b-c189f5ca247b', '5011496-64.2023.8.08.0024', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('31d25c78-4a30-5ed8-96dd-8643f1186ab1', '0001031-25.2023.8.16.0100', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('04ef06a0-e71e-5672-bacb-88443974d99a', '0004687-96.2023.8.16.0194', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('12ecee4e-9efd-554f-a600-7a4ac22dec12', '0716375-60.2023.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a60bad14-ebd9-5ab5-a695-8c2e9676c698', '0003570-92.2023.8.16.0025', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('365beb9c-5f42-527c-93fa-acb2bc778d61', '0846745-94.2023.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('091aa5e9-e58c-5c24-85c4-88a3be669225', '1005591-58.2023.8.26.0344', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7124bb82-dab0-5717-baf4-06c88a5c8b5f', '1000980-40.2023.8.26.0125', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('71f52940-9f7a-5b08-9095-84bb7cba66c8', '1017610-68.2023.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9d1b7ec7-61a5-5b78-af91-305d4ddf5671', '1046927-95.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f5a7d45d-e790-5955-9232-37e21a3bcdd3', '1013855-66.2023.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('961f4b9b-bc92-5cbf-a649-6dfd78198a90', '1008526-21.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d14b6f23-6e9f-5e4a-a7af-0be9fa4e388b', '1001377-68.2023.8.26.0394', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('91a4cc00-c726-52a6-8562-caca269f07af', '1008594-68.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8aa58432-45a5-5dfa-b2cd-043cb1ade5ff', '1006172-62.2023.8.26.0477', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('97956830-2761-525c-8c37-3e466d63a767', '1001010-13.2023.8.26.0372', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('20083974-b901-5789-b165-2f8bfbd6fef7', '1004146-74.2023.8.26.0127', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('929362d2-9983-50d1-8fc2-b167b6a306fe', '0201222-09.2024.8.06.0075', 'TJCE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b1b5827e-e6fe-521c-ad05-02331b0b81ae', '0806588-58.2023.8.19.0008', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c7eb8271-cdf5-5dbe-8903-24439261cece', '1011707-02.2023.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('55467d6a-c0d6-58a5-ac79-a5d9d5752ddf', '0008958-58.2025.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('575ee855-0c3f-5bab-b3e6-289a59e73c31', '1010089-56.2023.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3d02a710-fe02-59ac-965a-4811f52bfbaf', '1003934-85.2023.8.26.0278', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f9238b13-5a9c-5fc1-959c-893a708a2c64', '1006229-93.2023.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1da0b6c9-989a-5fb6-b24d-2c326059c1fb', '1029650-69.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('14db1f0d-f948-5d24-813f-20b2b30482c7', '1002252-30.2023.8.26.0526', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f668fc82-c0a0-5e94-b7f2-5125a4ef9fda', '1009778-55.2023.8.26.0071', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('09a93dcd-3343-560e-b701-1b1d6b09f5aa', '1018791-07.2023.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ab601299-4847-5d72-a7a0-11538ebe1219', '1029375-23.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1f36a241-19bb-5d21-99c2-58822832b5d2', '1002922-48.2023.8.26.0565', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('79d18dc9-eb7e-5eac-a6a8-d8057da2f2c2', '1004462-12.2023.8.26.0152', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('28ed128f-66f9-5bef-8143-54c166c99601', '1009781-16.2023.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('68e7e221-513e-55fd-b5d7-06ef861fc83a', '1031972-62.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('04fcd4a7-4104-5c59-bc00-bcbd436b63bd', '0018111-55.2025.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('52b61ad4-0b74-516a-8a34-0199c7d59ee9', '1011755-80.2023.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('34c5519e-c353-519e-907e-b64f4d460693', '1003277-85.2023.8.26.0362', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5bb66180-69d1-58e4-bd22-64bcb6477b34', '1000460-83.2023.8.26.0512', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('69c92306-d199-50ef-9f99-0472c8cc91ea', '1002766-76.2023.8.26.0010', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('91e4a047-d8f5-52cd-a518-5c28d855d088', '1007797-53.2023.8.26.0309', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9a826bac-a426-5927-9923-5b695fd5ec33', '1005397-05.2023.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7484fa05-f214-5667-84ee-5b46b2994714', '1054426-33.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('275f5332-bc00-5929-a2ae-62a18c5dbc59', '1050881-52.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2bcc674b-4335-5e8a-84d8-d02c0db49b56', '1007812-22.2023.8.26.0309', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('adb85a03-3303-5075-9b61-6843e42c8a77', '1029807-42.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fcf99016-faa8-5e4c-97d0-75bdbb64abf9', '1029822-11.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('16c456c2-d672-5875-b081-498aee4b6e9f', '1010607-18.2023.8.26.0562', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fa1dac85-0399-5daf-8ea9-ab52c1fb135a', '0813953-57.2023.8.19.0205', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('68ad34d4-0fca-5e98-b879-72737e3e2e79', '0819622-61.2023.8.19.0021', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('034d98d9-22af-509a-9935-b2d4f201d3d0', '0808802-95.2023.8.19.0210', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('df732abb-e896-527e-85f9-14e47e215c76', '5002357-74.2023.8.13.0210', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b90b5e96-7f3b-58f4-8a02-d4d565aea494', '0007324-20.2023.8.16.0194', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e206549f-6738-5b94-8f08-a39cc41df426', '1012371-33.2023.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dac0c4b3-2100-58ea-8033-c8a7fbe7cfb5', '1010301-73.2023.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('63d98ac5-adf4-5d14-b746-4955405a5b24', '1005215-77.2023.8.26.0019', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fa629bf6-1b1c-5478-b128-deffd91841f8', '1010390-03.2023.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0ad8bd0e-3e82-5154-b2c1-a9b932dd1a28', '1012393-91.2023.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9f34dbd7-8f7f-5886-b7e8-9d7493618045', '1019803-56.2023.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('254c75e8-ef8f-5f49-9ec0-6581dd174328', '1019808-78.2023.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('72ea31f3-c897-5e39-966d-1aba6ee9357e', '1003079-21.2023.8.26.0565', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e14415f3-f863-5e6a-8b32-f5e062ec1e16', '1010345-92.2023.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fc1e1128-fab0-5c7c-b018-81d3190767db', '1001816-17.2023.8.26.0156', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('42c3f5fa-05d1-5c43-b138-94afdecb9ccf', '1005731-30.2023.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7d8957b8-b059-51d2-a354-4cf077cd8ef6', '1001094-73.2023.8.26.0514', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b88a9bff-68d6-51ba-8570-e106007e10fe', '1005243-45.2023.8.26.0019', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('89dddbde-3d5b-5e95-abb0-49d324265fbc', '1005667-29.2023.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('189894f0-7dbd-5682-8846-b5cbf7b5cce4', '1015322-40.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2db8401a-d449-5abf-b8d1-3ae26bebd9ba', '0853417-21.2023.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('48d1456b-d855-54a4-86d7-212320cac33a', '5088778-43.2023.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5ae2c124-40ad-5b14-9b6e-6ff0a81bb71e', '5003562-66.2023.8.13.0040', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7e953947-91ba-542d-94a7-8c445c148a27', '5013253-46.2023.8.13.0027', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('81441ccb-a7eb-5fb6-a791-f83d09fbe929', '0823418-09.2023.8.19.0038', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('52acb42e-4f7a-575e-818a-e72948468f36', '0823412-02.2023.8.19.0038', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('97b3e651-f666-5f7d-8a63-d8fdb9a937e3', '1032433-34.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a1bc5829-7030-581a-953c-163348fd78ad', '1019236-64.2023.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fad8690d-59cd-5ec1-9fa5-62c646cdce75', '1002172-40.2023.8.26.0082', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('90ef465e-737d-563b-ac88-b3cbcc9c56ce', '1003296-05.2023.8.26.0132', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('15ca5a05-add8-5edd-ba97-cb8c3232e29f', '1013525-78.2023.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('07082c55-1719-5dbd-8053-c1c06268c38f', '1016450-38.2023.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0ce3f00a-d87e-5e22-809c-91d1a8413a9e', '1005963-51.2023.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fdb4ab01-3bac-54a8-86fe-728fd558930f', '1056462-48.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e255fdf7-4529-57c2-a50f-5b1846abea05', '1006966-96.2023.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a1264e7f-d6ee-5a9f-9ba6-e82eb0ce05ad', '1001669-05.2023.8.26.0022', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c02dc9a0-2cb5-5b29-bc8d-f466f2302325', '1006974-73.2023.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cfb2a099-17ee-52a2-87bc-329d9d1bd095', '1007169-94.2023.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5ddcf9f5-3f5f-58da-86bb-9d1f809d426a', '1011203-26.2023.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e79011fa-f411-5b42-a9c4-6884f61a6c23', '1056602-82.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('abbbd8cd-ceee-5f7b-a66c-ab1edda93145', '1020811-68.2023.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f260f311-4a8a-5a59-94c5-3be9d898add8', '1033295-05.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0c2b369c-4335-5cc3-9ddb-5ca445f9193b', '1005389-94.2023.8.26.0566', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('88bbce81-220c-5fac-b022-b3a07df3b23d', '1003585-14.2023.8.26.0624', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b1414f3f-9f8f-5840-9254-d825c9092401', '1015538-98.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9dd94f8b-f6cf-5886-a96f-ed1af5775e9f', '1005943-80.2023.8.26.0161', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d5c731c4-3d1c-511f-ae75-f92831e9ba64', '1002366-80.2023.8.26.0198', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6ddb4466-fe94-5c8a-b7fe-68a8cbdd2101', '1007328-28.2023.8.26.0011', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dd57d0fd-6e3f-5668-a932-3435ef4d47af', '1013754-07.2023.8.26.0577', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('56113c79-ebf3-5194-b7bc-66d404e885af', '1004452-61.2023.8.26.0606', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2556574a-4d13-57b5-af7d-65e33e8b184d', '1011598-22.2023.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dc047279-d847-5d59-9eda-20fbbba5f390', '1059812-44.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f583dd87-f307-5321-a8a2-56923b5721ca', '1021275-34.2023.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('16abcbec-f940-58ff-b601-59292dac6229', '1004572-76.2023.8.26.0292', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('91ec9513-62af-5d3b-aa20-e20298ee3855', '1011936-89.2023.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8a83ba07-ded4-55a1-bad6-044100d3f27f', '1061706-55.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('54c2a2f6-6274-5bad-8bff-1ac2ef8c8f68', '1011985-37.2023.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('29b70a0b-4b6d-5944-90b4-49d2fbe5d3db', '1003933-42.2023.8.26.0362', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('be21e450-5ed3-5f79-8eff-6b106999322e', '1007587-23.2023.8.26.0011', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('93402140-18f8-5777-a325-1ecf09fb4652', '0001411-34.2021.8.26.0296', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7888ef7e-7eea-5b7e-a36f-c721a9204995', '1006173-93.2023.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('faf7cd71-f388-5475-98ba-a8ea5bcf83ba', '1000641-75.2023.8.26.0030', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ef3fa7d0-dadf-5796-b3e9-c2740023be60', '1014591-93.2023.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('280f1c02-4918-5982-868c-ac85224403dc', '1036400-87.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cf783f6e-a1fc-5e1c-8638-4e714a6d4a80', '1022742-09.2023.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('268de4ce-fe83-5e1d-aa1e-a4e719fda6b1', '1006563-72.2023.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6925f176-7957-5778-8d33-8deddd43ce64', '1036480-51.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3f557ac9-bfda-59e0-9972-807ea9457e69', '1006573-19.2023.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('599363aa-5a88-5a26-bbae-42f7ccf28a25', '0805420-91.2023.8.19.0211', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7c387412-ed46-5ca0-b195-444a1867f643', '5013894-48.2023.8.08.0035', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f4f08936-abfa-5300-88a5-763a55afe7f0', '5009999-80.2023.8.13.0313', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('434163d2-3c47-5a2e-b4fb-2689d6443dbd', '5012251-56.2023.8.24.0020', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2f550737-a019-5713-aabf-af19bb4019b9', '5106228-96.2023.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2bdaa93f-5a47-5b6f-9297-9e0e7eef0396', '5106268-78.2023.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4776b7bd-d0cb-5471-8121-e68ebbd858a2', '5012535-09.2023.8.21.0033', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7627c156-8e3d-51c8-9a7d-56f12131826f', '5015623-73.2023.8.21.0027', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3abd5f1f-2de1-5731-8687-92b195bc8323', '0010994-58.2023.8.17.3130', 'TJPE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('af4203a8-d8c7-5653-bc3c-73b87fdcaea3', '5007397-68.2023.8.24.0036', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f89a386a-136a-5de5-9c33-ffa48c57fee9', '1016101-13.2023.8.26.0577', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5da646e9-1dc0-5778-996b-d67984a18a7b', '5348710-05.2023.8.09.0051', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2398aac5-5a2a-5251-8c82-58e178c69e4e', '1043653-29.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('76e0101a-9c1f-5c32-bf60-ae362de0f6da', '1021041-43.2023.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9a56fbfe-e76d-5fc9-aab0-f08296b0fd91', '1014150-53.2023.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('db26ceda-beb6-5eac-8f72-dce7d1c2d918', '1003573-07.2023.8.26.0266', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('21948540-8b1c-5449-9c6d-01acfa3bdfdc', '1005876-38.2023.8.26.0510', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dfa0b236-8e42-534f-8270-be7a639630b1', '1009289-13.2023.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('47b237b2-e884-5a47-85f5-fc907aae4ac5', '5007510-52.2023.8.13.0707', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c9af2e0d-9028-5cbf-b658-76fec2ab13bb', '1044102-84.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3c9b5d64-03f6-5382-9d59-cd84cb2d0097', '1013437-76.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('67ac5ea7-28e6-58d8-9ef0-1c4df52a13bf', '1005489-65.2023.8.26.0302', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e820ac7b-4081-55e1-9faf-50a85071d864', '0800251-11.2023.8.19.0022', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0bc749a7-d92f-5f14-aaeb-95afbfc3e54b', '1017774-72.2023.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0483bdbe-aedd-520f-8b3c-d0e9dac914ff', '0004212-76.2024.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('67044d84-24d1-5195-a116-292ae8f01bec', '0724576-41.2023.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c325ac91-1b2e-5198-aa4a-5b7a3790dc55', '1075867-70.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1e0b3425-b02d-5e0e-9d31-8c4e3326fbc8', '0805866-61.2023.8.19.0028', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c8daecc1-09a0-5bd1-af2b-65809c85d377', '1004008-70.2023.8.26.0010', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d8dc0843-9071-5c86-9c44-a470282f2617', '5010989-50.2023.8.13.0223', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e986a871-730e-513b-a975-d04a75e2002e', '5126754-84.2023.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9e37aa56-61a5-5bbc-ad56-59da55de334b', '5017980-48.2023.8.13.0027', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ec0b1eb4-046d-58e7-8eb1-fa156f74c340', '2110387-11.2023.8.13.0000', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b239a6b6-439a-54f6-82f5-28df937122e5', '5004909-77.2023.8.21.6001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4d4534cf-5192-5300-9bf5-33966707294a', '5012252-16.2023.8.21.0023', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1f1392fe-a194-588b-a111-4c2746267c3a', '5001783-58.2023.8.24.0141', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e57b9c99-cd9f-5da9-b831-71a4fb550bb8', '5005946-17.2023.8.13.0035', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e3ed9494-2dfe-5d24-a99a-75aca5b3c895', '5127036-25.2023.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3f2596d7-d9d6-56a9-a3e6-194d3ec438fc', '0725188-76.2023.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7ae5f56b-204e-5f9d-981d-6434fbe76cd8', '5018654-73.2023.8.08.0024', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dbb09aef-c57b-5102-b4b2-af4c04929570', '0002413-48.2023.8.16.0037', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b31e81ef-f88e-5e08-a5ac-1a4016fcd3a1', '0009869-67.2023.8.16.0031', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d5d0f39b-8368-555b-9954-b779e0aa77ee', '0005984-66.2023.8.16.0024', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('195eeb5f-3c31-5519-abe9-864e619c7617', '0725533-42.2023.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('eaed5a24-49c2-5c88-ae8e-0e623f5fe1d9', '0725541-19.2023.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('74ad4bc5-696e-56c7-8249-91bf7bf64dfe', '1080795-64.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bb2c6b44-16de-53eb-84b2-bfeb27716c8c', '1004323-93.2023.8.26.0529', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('27bf31e0-b5f5-55bc-96f3-6fdd8d071c41', '1047854-64.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ca7c26fc-52d7-5145-bb30-4d92ced83422', '1080872-73.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c152a8ab-25a0-5866-b61b-19f341b90511', '1010190-42.2023.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a2de2183-3872-5b34-93ba-e7058032de70', '1047937-80.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c52db125-0266-59cb-a38f-ffeb4c7c2213', '1010197-34.2023.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7d6eddd8-4c15-5642-b80f-79681758a224', '1003783-57.2023.8.26.0428', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1ac35d05-4083-5648-b46f-2c8e43fc7515', '1047989-76.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('73bc4b24-347d-5497-a9a2-1d91bf355afe', '1021423-93.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b1e7bb7f-a65f-52e7-add6-e66ddeb2c8cb', '1014662-34.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('af861eb5-30bb-5d3f-abc9-2ecdaa1907f1', '1021634-32.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('03a424b9-9ea2-5df3-8c8c-29709df31110', '1010313-40.2023.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7c759d03-fb78-5fc1-a46a-c050d4d898f2', '1015528-48.2023.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('00af3269-bfa2-5fb2-9971-7f49ab5e80a3', '1001453-22.2023.8.26.0288', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9ead73c0-605f-571f-9962-3135a643d5d6', '1081806-31.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d0c79bc4-7616-57fb-825b-53bc7dd36b33', '1048781-30.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a43d458b-4818-5074-aaf7-7b4c6a6c7d9f', '2317701-61.2023.8.26.0000', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ec562ef3-0cb7-5735-9c88-a806202ff1c8', '1023353-89.2023.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c2570a46-be37-564b-9c9f-de6a6710e4a4', '1006543-33.2023.8.26.0604', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c2b23823-8afc-5140-aa90-72d97eeb0067', '1012215-34.2023.8.26.0309', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('521233aa-a984-579e-b5c8-4152f9ad9db6', '1019262-62.2023.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('df18325d-d76f-5d2b-9ee2-30663639298b', '1010292-03.2023.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('699897e5-72fd-5335-99a7-16b18bd841ad', '1030030-08.2023.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0c1205f0-9a69-5666-945c-e12093a83fda', '1015669-67.2023.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4d2de067-4efd-52ad-9474-bd0a145e63d5', '1021850-90.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b6c4a64d-6b6c-5008-8590-1ec104934da4', '5036212-23.2023.8.13.0702', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bf469d9d-03ea-54fc-8764-b0c934ced983', '5010585-30.2023.8.13.0245', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('175ff980-99d4-52de-a07b-a39e626f58a6', '1016978-22.2023.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('94627a8e-5aa0-59ec-a4a3-28c84e9d9917', '1002814-05.2023.8.26.0505', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ab118469-2627-5853-acef-391cfa55343b', '1001973-39.2023.8.26.0366', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ee4bb282-8c1f-5ee5-bd47-a31e1a89590f', '1052788-65.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('655e5323-d07e-5a48-8cc3-5f589569a63d', '1004622-75.2023.8.26.0010', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cf18da07-c85e-5b86-afcd-79c50be13272', '1025879-29.2023.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1a427ad3-8f28-5a6b-ac88-4a6a7002db73', '0822989-26.2023.8.19.0205', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('27d2844b-ac8b-5b89-9cc4-9f1be213517f', '1008559-49.2023.8.26.0348', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ecb45290-5cf7-5a7e-ad7e-0155369811f6', '1007214-32.2023.8.26.0127', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bb07d6bc-15b7-5143-84e2-82d2c4e877b5', '1016806-74.2023.8.26.0071', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('22827763-7ac3-5e04-9b28-17bce067987b', '2239981-81.2024.8.26.0000', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('22e4703f-4d0c-53e5-8a67-2824c025ece3', '1004303-17.2023.8.26.0428', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ad183333-9baa-5fda-a0c0-f9c5ae9f733c', '1030154-30.2023.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5e504ff4-96c1-5e35-9443-40e8d005b9a1', '1053115-10.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('aab639d3-2d81-57a0-ad8a-140291dda977', '1011107-97.2023.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1ba59fd1-645d-58c9-b581-349b1cddf605', '1030216-70.2023.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6edbc493-8f6a-55a2-8fad-71d1c71ca0c6', '1004984-70.2023.8.26.0271', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('59069d2e-4581-51ee-bcc6-24d9f0ea1585', '1021047-89.2023.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('806e7498-ac82-530c-a225-6af56b98c9f8', '1054438-50.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2edbdb8c-3f30-5af1-a95a-7066f1312355', '1054477-47.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('08a5ae11-070a-5578-be31-4c6307e4feca', '1054641-12.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f197b82d-fd1e-54f5-a814-c6533c93b394', '1025825-63.2023.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e792559d-afd4-5d9b-a948-1e6510f08ad3', '0805062-90.2023.8.19.0029', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('09e06e6b-d046-5df2-a1a3-432e1fad34c7', '1021612-31.2023.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('84bb483e-5824-5529-82c2-20f8d30d757b', '1011650-64.2023.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5761abe8-e730-5bce-bae5-b57a1ce18639', '1009063-05.2023.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1e2e09fc-a355-5ed2-95a6-ad865d2ceaba', '0001881-48.2024.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('554087e5-7a57-5bf9-a362-88a7ce521dde', '1026045-61.2023.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e0e53d87-9cf3-5e68-aad5-4461566ce9a3', '1021304-53.2023.8.26.0577', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6b83d4f5-2c23-5c54-8a5f-34776ddd171c', '1024555-61.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('078d1b83-ecea-54ea-ad8e-f97f83aa3888', '1055356-54.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e8b9ef9c-6864-5c9c-9e67-d2ed40b7673e', '1017588-91.2023.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('14d0be60-b5d6-5c42-946f-c18ccf5de64a', '1024580-74.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('63b8c1f5-ffb5-52e5-b4de-b0faf8580c4b', '1013496-69.2023.8.26.0068', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e557a079-216d-533a-9543-5226a4526743', '1008585-72.2023.8.26.0566', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2b567f1e-9b1f-5429-8a04-7acc018a2853', '1095287-61.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('16daf98a-9d99-5a0c-bd0e-f2ec78177621', '1019218-57.2023.8.26.0562', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d1b6e019-8e84-56dc-b457-e460a0655e2f', '1095415-81.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('19c02639-7a83-5276-9334-4b2d3ba6e40a', '1025035-39.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('07ed5637-b5a0-54e4-9d38-fdc026fce26c', '5032490-27.2023.8.24.0038', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7ef32d98-2ec9-5621-b137-23e507c2da57', '5022058-03.2023.8.13.0701', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5b95abdb-5798-527a-ac0b-ceac4888d817', '5013453-90.2023.8.24.0045', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('99ee17b2-ad43-515c-a993-08a1b33a725f', '5053251-51.2025.8.24.0930', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0ab7b0e2-895a-5a28-a493-3b4fc9c3ae2c', '0817642-09.2023.8.19.0206', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dabbc3a7-ca2a-5f77-b490-f63b3534718f', '5516686-37.2023.8.09.0051', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8d00bae1-4a6c-5c2b-afb1-298a29fe9f21', '1015616-85.2023.8.26.0068', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c697d3c0-28b2-59f8-9557-93e6bbafbe57', '1004163-93.2023.8.26.0650', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('53803229-dc4d-53f8-9be2-c933dc01c108', '1064517-88.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('aaca6216-ee7f-579b-805d-3395bba9bf8e', '1036047-02.2023.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ae9c134b-62df-595e-baeb-004f5c6c05e9', '1013919-27.2023.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7b3794de-211b-583f-84f2-07c01701bab5', '1004335-54.2023.8.26.0191', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('90db3fcd-727c-59f7-ad9f-d236de1a2f02', '1064622-65.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('600713ea-81d1-5a44-832e-2585fde48f88', '1028483-20.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0bc49336-1bd0-5657-8eae-5cc049970351', '0005073-76.2025.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9c661156-c74b-5f50-9ae3-c923d2123f57', '1015752-97.2023.8.26.0451', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b640d8bf-05f7-58df-8f21-8dd2ea8882aa', '0008792-11.2024.8.26.0451', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7f68e7f8-0d28-5602-aa46-5e901a500ef4', '1064885-97.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7140f059-4139-5de4-a798-1c81198d2ae3', '1011433-63.2023.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3df4dcfe-f2a9-5c03-bb6e-ceae0615b612', '1007984-34.2023.8.26.0609', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a12e679a-f5ae-504d-8f3c-b39b281ef22b', '1010770-37.2023.8.26.0161', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('17a7f6d0-dfbb-5762-8d8b-545b2227281f', '1112260-91.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5d99de65-a24a-52ba-834f-096fa5b8b839', '1038445-07.2023.8.26.0506', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('31f307e9-8e7a-5a6d-927c-62c06351b40b', '1019994-79.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3391f1f0-fcc6-5a4c-9193-616a0c818ffa', '5024593-38.2023.8.24.0008', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7989e13d-a263-5936-9da5-3c94c1533a83', '1014404-27.2023.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ae7ce027-3bdb-53cd-98a1-648f3c14d650', '1066964-49.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('aefd87f1-c706-5076-b5b6-4852c187cb47', '1031153-71.2023.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('77ffe1aa-13a0-5faa-bc24-54d6bdadce90', '1026197-51.2023.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('15d3d370-1ead-57e6-b20d-ef67875d1726', '1067168-93.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('753fbfce-263b-5ef9-802f-4d3d64d06dac', '1025822-28.2023.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('aec7939a-cd6c-5de7-bb2e-0151503d71bf', '1041080-31.2023.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e13fe840-f8b8-55d6-bdb0-4f0e409cb4d1', '1025390-67.2023.8.26.0577', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4f30b249-2238-5521-aaba-e51902874c2e', '1010944-17.2023.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a8bc3617-99b1-581d-881d-60dc97503bb4', '1020205-18.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0f623491-8b05-55f8-966e-5fadd92ec9a0', '1020213-92.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2203cf9a-b151-5ce1-a774-83aeffacdad7', '1013868-04.2023.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('82ffe4ee-8be0-565d-a5b3-e2284000bba1', '1001565-33.2023.8.26.0080', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('59fd5465-0090-5c89-a59d-a5212b859c93', '1041183-49.2023.8.26.0576', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9bf7e52f-2be1-5cdd-84a8-c5f5357b61ce', '1007665-72.2023.8.26.0704', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7508b3ac-f713-5509-8cb3-67e20cf73e84', '1005099-03.2023.8.26.0268', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ab98f407-cc24-5778-bbef-abec7b8dcbec', '0910835-14.2023.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('243ca1d9-e044-5cd8-a8cd-6197da5b2dc5', '0026059-98.2023.8.16.0001', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a5268877-c37b-50cc-917c-fd31bd117819', '0026063-38.2023.8.16.0001', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e4afb918-851a-593c-b284-faaeb6a3d195', '5026384-88.2023.8.13.0027', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('424800da-debb-5a25-9479-504dc0df33ea', '0847189-25.2023.8.12.0001', 'TJMS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a3546360-c815-572d-8d1c-3fb361048633', '0013112-15.2023.8.16.0194', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('48ce6d93-60be-526b-89e8-fbd818916c5c', '0011752-07.2023.8.16.0045', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2066bb5d-28d5-508c-b34f-045508aee696', '5557168-27.2023.8.09.0051', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('007148d5-3287-5cc1-9783-e66c6da1ed46', '1023223-25.2023.8.26.0562', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d9bdb687-3c12-5658-9ecb-9e3153c08ff7', '1010935-08.2023.8.26.0348', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('182f8696-b8c7-50e7-86bc-701c5edb838c', '1014258-71.2023.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('193c13f0-e3cb-56bf-bfb7-b0056963989a', '1000849-42.2023.8.26.0165', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c144dbd6-fa5e-509a-bd5a-77eac7ab62e8', '1011288-95.2023.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e5762df8-ee74-50eb-a061-dc2efbeb5b98', '1003869-51.2023.8.26.0291', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5d1c1309-8687-5604-b779-f151871fcced', '1117291-92.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2e75219a-15e4-55c4-84d8-aa6e5e1f1310', '1001903-95.2023.8.26.0180', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('84511857-5d48-57ca-8a14-d07e758aaec8', '1011571-58.2023.8.26.0320', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dcc83d52-a085-54e1-a7a4-cb9c4fcd6f43', '1006542-71.2023.8.26.0176', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('70226cc0-2c9f-5e43-8fd3-9e9055fc025e', '1020892-92.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7749a815-e8f8-5448-8fa9-2d7bc672b55d', '1020901-54.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a8981cec-2e87-54a2-921a-9f64045e628b', '1010994-93.2023.8.26.0348', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2f7d00e6-0bb8-5370-985b-749b52cdd0f5', '1003689-23.2023.8.26.0101', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('28786d3a-2d5d-58e0-9ded-0d273e53f3c2', '0814965-13.2023.8.19.0042', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c34ab72f-d6ce-5be9-a6af-c53c5b9c898a', '0913930-52.2023.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('081ad78d-46c0-5c5d-b91f-551e7b18d2cd', '0808896-52.2023.8.19.0207', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c4740b05-7c0e-5612-b45f-8c7ebda79cd2', '0808897-37.2023.8.19.0207', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('73a2cbf8-0564-53b7-94f8-50cb77678154', '1120354-28.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('54b00798-2c06-55b1-b077-fdc4605a121d', '1071715-79.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d7df4b46-51cc-5958-b6f5-45917cff6e4a', '1039990-27.2023.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('239c89eb-34c0-53ae-8281-a492e0c706ca', '5006373-77.2023.8.24.0012', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1937c71c-3795-5671-ab98-5dba011e578a', '5179921-63.2023.8.21.0001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6d37e582-8674-5c1a-af7b-73a312dc5f75', '5011266-20.2023.8.21.0037', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('77725e6f-a36d-5413-a908-696f674c28c7', '5011156-18.2023.8.24.0011', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('20fafc7b-e7fb-57f8-ab05-3262a0fe2cc1', '5048290-49.2023.8.13.0702', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('66a20f4a-551b-5b61-bbc5-c39d9c69b514', '5048295-71.2023.8.13.0702', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c66c03e4-bd55-592e-a03e-6c4779c3877f', '5007336-40.2023.8.21.5001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cedb3a2e-cb9b-5c2f-aee1-0aa24ff6df45', '5041623-64.2023.8.21.0010', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('11df8114-294d-51fb-86c1-bbbcedef24b2', '5035323-92.2023.8.21.0008', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('018c94c5-1b4a-52a5-96d0-ce18bddee1de', '5041662-61.2023.8.21.0010', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f830d399-7a71-5755-bc98-99ee6ed57e75', '5049624-21.2023.8.13.0702', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f717b49d-e65f-5b0f-bdf7-3a5112e492b2', '5202378-42.2023.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fdb0bb9f-9177-512d-9b7a-c0ab94273bb6', '0103978-53.2023.8.17.2001', 'TJPE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0da5b1b2-143c-5b5b-98bb-5a798ac31d07', '0737377-86.2023.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('29f8efb4-f0d0-511d-a5df-49a6c98ff70e', '5022120-03.2023.8.08.0048', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a8b90d20-739a-5441-a850-dda3f3cf1119', '0010405-49.2023.8.16.0170', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a0b0fc7d-d9da-5546-a9ac-f53d317002a7', '0880454-34.2023.8.14.0301', 'TJPA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bce53d01-643b-5e9f-a797-1042ace39067', '0801089-98.2023.8.14.0116', 'TJPA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('291862c5-31c7-5db1-ac41-8f271e19372b', '0833928-71.2023.8.19.0203', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b45ab8ec-0b41-5179-a8bb-3af136c90348', '5027710-37.2023.8.24.0008', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('223a4c8a-bd4f-5156-a2bd-a8e59583d981', '5007548-61.2023.8.21.5001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2110ce3f-9999-5187-8c2b-0be6558e3b8b', '1005042-03.2023.8.26.0650', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('28921268-cb50-5d88-be91-da67b3fb7913', '1002494-28.2023.8.26.0222', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('04ec968f-ab56-5e84-ba36-7d54ce3894b8', '1001084-35.2023.8.26.0512', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('628830b0-bd75-5cc9-9b27-a5e44eb89e76', '1076129-23.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('53ccb5af-d720-5726-a88a-71c3b2d3116d', '1023113-48.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bd7fbfa8-1477-5fd5-9782-c0385bacbc16', '1016412-26.2023.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('db18f49b-40f6-53ea-b12a-a66e0d2abff1', '1023120-40.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('44eaddcd-17d6-54e1-aab1-ff1de5fe9bdd', '1129852-51.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a5ce00d3-608b-509c-b2f1-58f6b95f9e66', '1023126-47.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a5abd8de-a39f-5cb4-801e-140366d3a4e6', '1005267-42.2023.8.26.0191', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c253da1f-771e-5084-9419-8cd1248e0f99', '1015727-55.2023.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('eda3c6c2-3622-54eb-b74f-968c812bb1c9', '1024653-36.2023.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f7570e49-1a83-5780-b386-3a4fb58dbc6b', '1043010-26.2023.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('28e3d079-5d60-5c9e-acd7-675f06d0c821', '1029267-46.2023.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1578b163-2c4d-50cd-b454-ddae1b47133f', '1029475-38.2023.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dc69ac70-b3b5-54a1-8a8e-1e88e0a09606', '1015982-13.2023.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e2d7dd11-8617-5ec5-b797-b54d2c331d26', '1029700-50.2023.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9ebc326c-228b-58cb-914f-46ed1c58008a', '0832043-16.2023.8.19.0205', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7ae463fd-4424-529c-a441-d72365d839f9', '0925727-25.2023.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d1241203-b984-50ed-bbb5-feaf8492a3b4', '0822028-94.2023.8.19.0202', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a9a208b2-8918-51c9-b019-514e96844ed2', '0029136-18.2023.8.16.0001', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b083742f-47aa-5466-87f4-9277ae1b67c6', '1046854-53.2023.8.26.0576', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3aae45b0-7672-562a-8d14-d38c8ecad5d7', '1024722-68.2023.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c3ed8bd2-1caa-55f2-b7d4-50e7025c606a', '0002861-72.2025.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('60b49d0d-1c7c-5f88-9028-5e45dd13a58b', '1036100-71.2023.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('da738038-136f-5afb-9db6-9b502c5ceb16', '1009499-07.2023.8.26.0609', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2a42a951-f7c2-56be-9302-ebe85bcb2ffa', '1132161-45.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('efbe6878-aa5b-5d64-a0bf-e60bba66a3fc', '1010122-86.2023.8.26.0604', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d103887f-0f01-5c40-8ae0-2d2a76ae84f0', '1013900-15.2023.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5035a7f4-a630-5487-a7b4-24b2520aa3ba', '1019293-41.2023.8.26.0451', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3131109d-720f-5c52-af07-c323d2d034e8', '0009443-43.2024.8.26.0451', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f81faa6e-8edc-576d-ab53-b1a6dc2c89c2', '1030167-29.2023.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7df38672-edfd-5edf-80f4-48e431641aca', '1023646-07.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('71838de9-84cf-5171-a493-25e093320f7b', '1023651-29.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('784833c0-2fb8-5633-8319-d170113e590e', '1029713-18.2023.8.26.0577', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b2ae5651-6599-5a37-85cf-988dafdd4bc0', '1006892-85.2023.8.26.0038', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5d813757-45d3-511b-b55c-c4876ac850b6', '1029724-47.2023.8.26.0577', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('827dc6d9-9af8-5d06-93ef-7ee44cfbf398', '0006542-78.2025.8.26.0577', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c955c2ac-827f-547f-8d06-37be7c719424', '1017137-63.2023.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1c014fe0-222f-523c-bb3d-7291a4714ca9', '1023670-35.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('89d7c400-bcb2-5514-b695-f1813f866f11', '1132849-07.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2211b6ab-058d-57d5-a59f-53bb5093041c', '1010567-98.2023.8.26.0606', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bd7e0ddf-8079-5f0a-a447-3660d8017e08', '1025282-14.2023.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ca4aff01-7bfc-5b79-a594-ef9674c8585a', '1037060-27.2023.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0fa1a0d1-4c5c-5307-8e2b-667b060097e3', '0824796-72.2023.8.19.0208', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('99677af8-d44c-53ee-a17f-1dbc5b343ffe', '0805086-40.2023.8.19.0055', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3dd5f8ed-66e0-5782-a316-c2e9d6086978', '0833002-84.2023.8.19.0205', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b32c868a-66eb-59ad-80cf-7abfd7204ff3', '0836055-79.2023.8.19.0203', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('71db44ec-6bab-5882-b39d-4b97d61163f5', '0740216-84.2023.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('983cb3ca-91f5-5a8b-86ae-a56bb5986f78', '0029970-21.2023.8.16.0001', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0acb4dca-7bf1-5385-9d07-bec8012b23ef', '0004393-30.2023.8.16.0037', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('895d4966-a27c-53f3-bbe0-da0d64324417', '1135022-04.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b75f1273-eeda-5dcd-b467-2b78c0e05e5f', '1044574-40.2023.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('49f72abc-71e3-5366-b355-44a71ef08f83', '1048014-32.2023.8.26.0506', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c25ae545-f0b8-5fc7-b529-981d46c006ac', '1011011-41.2023.8.26.0248', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('de501420-d1cc-5d43-9864-2b6b0e80d05e', '1004710-94.2023.8.26.0663', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('19a0201a-8599-5f9b-ab39-d3a7c8f1cb9d', '1009292-14.2023.8.26.0704', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a62ca272-d9ee-5d25-a1a2-33b9e3fc148a', '1012966-98.2023.8.26.0348', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('240814fd-554f-53da-ad88-e983b3993a12', '1081756-08.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('86c3bdf7-8844-53c7-b443-af0b7182813e', '1009572-02.2023.8.26.0278', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('01836961-0367-5565-a6fa-26733bc86e3c', '1016733-97.2023.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('18aaf27e-b87e-54cd-80ec-629799a63a9b', '1049528-20.2023.8.26.0506', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('495e6feb-e95e-54bf-828a-601c2bd6a5e2', '1032254-85.2023.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2f7c8ac4-d34e-53d2-b5af-5838fff7c115', '0200428-73.2023.8.06.0058', 'TJCE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('790472c0-94d6-52e7-b7ac-8fd94b41c9a6', '0266317-48.2023.8.06.0001', 'TJCE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('19ae1382-0d1c-5e8c-b1e2-06ef077f057f', '0266335-69.2023.8.06.0001', 'TJCE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('642b6443-61da-5e93-aff2-c5a473518421', '0203186-83.2023.8.06.0071', 'TJCE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1667ac2d-8ba4-537e-ab4d-b42b4092b681', '5093209-20.2023.8.24.0023', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d447937d-bf41-58c5-b54e-21e6a40347e7', '5028014-97.2023.8.13.0701', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('00aaee04-bf43-57db-a3b0-1f9e45bf38ae', '5003661-72.2023.8.13.0319', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dd39fcc4-c94b-5307-a640-5ae73cf5da3a', '5055408-76.2023.8.13.0702', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a5a0b7a5-d649-59b9-8c4a-07a871e61daa', '5005584-88.2023.8.13.0431', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e53cb75d-c888-51b8-b605-41eccc5d961e', '0815435-88.2023.8.14.0040', 'TJPA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('767c3a40-b6e8-5d15-bb34-02736d3c9834', '0030782-63.2023.8.16.0001', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1331ea9b-a54e-55cd-b0ed-23049776cd45', '0741228-36.2023.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('794d4ab0-14f7-5b5f-9dc1-4d7c9e6580ea', '0865285-84.2024.8.15.2001', 'TJPB')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4f32e708-a06c-5b69-b76b-b5a96aed9dbb', '0741233-58.2023.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5a1526d8-78ea-5382-abb8-3a8c670c07d5', '5024206-44.2023.8.08.0048', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('60359af6-2944-5b2c-adf5-52251bb86af6', '0823113-06.2023.8.19.0206', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c79478fa-7561-59ec-aa7e-71cc78be25b7', '0939237-08.2023.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5d6a791b-0c02-5109-a139-5b6ca5126002', '0068636-52.2023.8.16.0014', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4d4749f2-2248-59d7-ab45-e4e719075cde', '1010394-46.2023.8.26.0292', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e1e84caa-2b2b-5c25-8297-21230c501f35', '1015414-03.2023.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3c51aa90-7161-5ed1-8942-f89a98080539', '1048364-32.2023.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7555afdc-5c24-54e9-8d08-f2258adf6491', '1051933-13.2023.8.26.0576', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f6644d0a-f2c3-5f7f-a32f-06bf1298187c', '1034347-21.2023.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d5e70d23-c158-5ffe-b406-ee76e4f4985e', '1021573-82.2023.8.26.0451', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d6502bdd-9dd5-5017-ba6c-6e6bb02d176a', '1018465-77.2023.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('23df93d5-97d8-51b8-a485-08476ea60271', '1139648-66.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('de5a9485-ef31-51b9-8404-9f8ae3ff83e4', '1003816-32.2023.8.26.0045', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c595f9af-32a5-5148-bba8-4f9dcdba86ae', '1016987-70.2023.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('22525a37-219c-5399-99ba-c7ce035c95b5', '1004409-65.2023.8.26.0270', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ed1a0430-cb95-5d6d-b907-87d5bbc3a646', '5001707-03.2025.8.24.0064', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('330e443d-e0c6-5cdc-a650-195c1a993c20', '5023769-78.2023.8.21.0003', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a8dc5df1-c835-53b8-9e20-e8f8ebd50ec3', '1020519-81.2023.8.26.0451', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f213a6cb-bdb9-5bec-b87a-b840487df63f', '1018097-19.2023.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('763dd150-fe61-5912-9dd9-d5bca9195030', '1013423-12.2023.8.26.0161', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7f393dab-89a1-5bf9-b9cc-55addc9e25a0', '1016870-70.2023.8.26.0011', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6854a14f-45cb-5ba6-85a5-2bdfeb4ae787', '1036465-85.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3d58b420-ce9f-5106-ab44-722f15a754a5', '0742806-34.2023.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2131258c-e335-5fe0-9a4c-0fea2d8a834a', '1047741-65.2023.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('baf02d21-e94c-5a9d-b2f8-c482bc46e438', '5004671-33.2023.8.21.0060', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e3424d12-8b2f-50c3-b8f3-2edfad3da1df', '1034017-24.2023.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3b6c8e84-8a69-5350-9433-6a23268216a6', '1014265-73.2023.8.26.0037', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d7570f77-dec4-56d5-8325-2d25d52034f4', '1037972-81.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2f9e92b6-e42a-5186-b154-adc8d9f4fd93', '1146447-28.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('26ddc322-fe5e-5006-84b6-c3674bfdbb97', '1027639-60.2023.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('46f87a5c-d3c4-5c1f-b4f8-b02abe9a097e', '1008212-44.2023.8.26.0565', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8bb04e9c-1577-5d58-9922-dbc2e942c665', '0053854-64.2023.8.17.2810', 'TJPE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a7664295-01c1-5d0f-aacf-a0f3696a6f6c', '1034518-75.2023.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('12d2fda0-91d9-59fe-b6c0-3953d9109447', '1033519-92.2023.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2b22502b-35ab-5260-b0c1-4191f122bb35', '1015595-04.2023.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0be91e7a-a111-526f-b4e4-4f9beb61e561', '0006304-60.2024.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b1ebf4ce-8238-5fce-a8b5-8bd8c6a4f39f', '1148860-14.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e33f8e30-8201-5fba-99a0-0c94bbc6b22b', '1010122-77.2023.8.26.0704', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9182e50e-f5f8-5530-acb4-5d6373f13288', '1028156-65.2023.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b01ea487-0edc-5277-a4aa-fe376bef75cb', '1018049-48.2023.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('36628cff-34db-50f2-9afd-c521c7b09ebc', '1007710-24.2023.8.26.0010', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ed94135c-3499-5863-8ec2-b23b7217ddd3', '1006694-80.2023.8.26.0189', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('eae953c1-6ff3-556c-808c-c26102582287', '1010265-38.2023.8.26.0099', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1a94dfef-a158-5551-82db-a40a17a26226', '5262637-03.2023.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('662035f2-a7eb-5b29-9d52-07c0801c0479', '0828484-54.2023.8.19.0204', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6ca1293b-5dcd-568f-a5f9-9ca7b386e494', '1026873-05.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2a3f2c09-ca0e-5ab9-ad60-8912442d97d8', '0006320-80.2025.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('140de072-bb23-5412-b1df-6e07ca8c3ec1', '1033700-04.2023.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1106961e-1111-5912-9831-e7dfacd7d801', '1034891-09.2023.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1d3d7411-66d9-5607-b4bd-c28708c36b96', '1150342-94.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('34e2946d-8488-55ad-abfc-0ae9c01fb023', '1001029-73.2023.8.26.0257', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a01398fb-ccb0-593e-b08c-eba75c1a2fc6', '1019540-41.2023.8.26.0477', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('65bf938f-3e4c-5ec7-be29-17ec708381c3', '5227163-18.2023.8.21.0001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c0270b81-18ce-5c96-a80c-366539bd9f17', '0836747-72.2023.8.19.0205', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1fa15af0-8d02-51a6-bfb2-4de5dfda2b77', '1021550-18.2023.8.26.0361', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('854ab625-fd94-527c-92fa-447fc8545f7b', '1013227-88.2023.8.26.0566', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('af76c7b2-5e61-55d3-89b8-c632338fbb47', '1003963-81.2023.8.26.0296', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('20fea74e-9862-50e2-8458-b013f894ba3a', '0041217-36.2023.8.16.0021', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c8f4e8bd-ad23-5dbb-96e3-37cabbe1a584', '0017039-86.2023.8.16.0194', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('508c72a2-e757-55a3-90d7-5c2bc407fb58', '0830253-18.2023.8.19.0004', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('68091630-0309-5995-8e8b-195682a4b12c', '0819787-45.2023.8.19.0042', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('308e1944-d8c6-5a1b-aaea-4800b411836d', '0814503-52.2023.8.19.0011', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('01f3a80d-eb3a-5d0d-927b-52a6a64e25da', '0808742-63.2023.8.19.0068', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1c9b23d0-d51a-5940-a846-34b48f6820dd', '0745343-03.2023.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3b4ae346-be86-5a58-915d-c81dbdee845c', '1011629-82.2023.8.26.0604', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('07d305f0-422c-559b-9257-e2e95976d79d', '1022084-21.2023.8.26.0309', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('35524c6c-bf3c-58f3-a762-0a308de24e76', '1004573-40.2023.8.26.0299', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('631a6a06-5325-557e-abf0-ba2af3619aa5', '1040915-71.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ebd29634-e191-5eab-b4f6-523451c39622', '1010699-55.2023.8.26.0704', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('514bd838-6622-511a-ba30-dd5d44135a11', '1004362-13.2023.8.26.0587', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a0a6f391-624c-58da-9216-eb92746ba61d', '1010705-62.2023.8.26.0704', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b9ddf669-509c-59eb-9208-707e1a65f313', '1007167-76.2023.8.26.0024', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('db5dcf3a-7115-505e-af81-4eb43b3d63e5', '1012306-09.2023.8.26.0606', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('112a795f-0648-5288-93f9-a3337aac5c33', '1018922-48.2023.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('25f04684-2460-5828-9eb1-1027623dc9d5', '0804250-31.2023.8.10.0051', 'TJMA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('527e58fc-c719-5b01-8741-f462d1b766b8', '5273567-80.2023.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5780b11d-9441-5a1b-bd51-5dc6f59849f9', '5236093-25.2023.8.21.0001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f6418ec8-faf1-5f34-b927-175cb0582b87', '8152937-35.2023.8.05.0001', 'TJBA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3c9d5aa9-056e-509f-98c0-f15a6d8b3ca0', '1028262-25.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('84669d00-7aeb-5ec9-97d0-82a2ca6c13d9', '1093674-09.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('53172ad5-86cb-5ffa-a9d9-e16c97e3307d', '1022296-80.2023.8.26.0361', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d20c1e19-914b-56fe-bb01-078b9b945d8d', '1051433-72.2023.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d390c14b-8ab7-5e5f-bb4c-ac22495f4848', '1019712-93.2023.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d37d5869-b6e8-5d52-9d13-33b8f79316b8', '1036672-66.2023.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f03da618-3ecd-5abd-99d6-fe6c3c8835c5', '0746361-59.2023.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9625aabd-fe6d-547c-9d53-b22075fe4ee0', '0826106-34.2023.8.19.0202', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4173cbb0-ed0d-50c5-97a2-45c34ff6353b', '1095241-75.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e1620821-652a-5984-a8e8-1a381529fc30', '1020249-89.2023.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ce0604e0-00b7-55a6-b32e-ed92216d4f61', '1036142-32.2023.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c7968803-c137-5a45-98cc-024e576d888a', '1012143-35.2023.8.26.0604', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9b49ff20-879f-585b-800d-b1922dc704dd', '5006381-06.2023.8.24.0028', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f7738259-69e7-554d-b5ef-7f178c8a8421', '5004604-22.2023.8.24.0016', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f0509765-b5bb-5c4e-bc12-90c9219929e3', '5011035-50.2023.8.21.0018', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bde2c247-880f-5a66-a2aa-d4725648c728', '5004496-48.2025.8.13.0074', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a4de341a-283b-5724-b56a-13a4db37d242', '5009283-32.2023.8.21.5001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0f1e601e-3be4-5c47-b1e9-c5a2ce1e98b8', '5026967-26.2023.8.21.0003', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f142b0f2-98a2-565e-afc6-172f5c15a040', '5276968-87.2023.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('69b4b0cb-12c6-5190-b7d0-db29fa9037b1', '0658511-48.2023.8.04.0001', 'TJAM')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('aa928b2e-d1c9-5381-a35a-cca4de118e87', '5033030-31.2023.8.08.0035', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c279b198-ea95-5ba9-a5d1-1b454b8801be', '5033903-31.2023.8.08.0035', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c874c28f-a391-5929-be97-2f52dd8f4405', '0013337-22.2023.8.16.0069', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ff7d0b43-01f7-5fae-a1c4-def6e4b38c7e', '0018081-73.2023.8.16.0194', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('44db8021-10f3-5603-953f-19f0b97a39c9', '0076274-39.2023.8.16.0014', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('64878ae4-cb65-5946-a08d-12b7bdc51174', '0840814-10.2023.8.19.0002', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f25d339b-7240-5113-b093-e981cc32472b', '0827137-89.2023.8.19.0202', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('00b04b44-6761-5323-9f1c-c97e2c3c40de', '0815534-10.2023.8.19.0011', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('73462f3c-796a-5026-8b11-06095728367c', '1036646-46.2023.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('de470d1a-2983-5a08-b4d8-a711134c7cd4', '1020602-32.2023.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bed14b48-2e63-5c5b-8e9e-649ac21e41cd', '1017154-24.2023.8.26.0223', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b77d6285-8f6a-52cb-bb48-b7c67ea5dabf', '1015824-52.2023.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c7a8f7ea-601b-501f-a7a8-6fc5f639484b', '1016062-11.2023.8.26.0320', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('18c923c2-0bad-51e0-8ded-e35a557635a5', '1004723-20.2023.8.26.0655', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2fb32f1e-1293-56a0-bf71-a5c2be4252a0', '1009053-42.2023.8.26.0176', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d71cedcc-6717-5a0a-8d57-11d2ba006e08', '2028031-59.2024.8.26.0000', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0126e60d-d495-5ba1-b4aa-c5cef798667e', '0826345-94.2023.8.19.0054', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ca749945-55cf-5512-a60b-bb17bb5983cc', '0825882-84.2023.8.19.0206', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('87b595e8-19f7-56de-b420-42ce08d85e56', '1169081-18.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b4a8be74-2ac3-521e-bb5a-16bb356bc9b3', '1017596-59.2023.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('aff5abac-c9bc-52f7-ae0f-3e1f367bec67', '1169300-31.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('18bd999d-28a1-5919-959a-98cd7cd75003', '1011758-50.2023.8.26.0099', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5b25d827-cbab-5c9c-bc54-00d8f81d417c', '1016117-51.2023.8.26.0161', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fa39b6fa-3ea9-5e24-b7f3-6b428c5dac71', '1004367-35.2023.8.26.0296', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cc0ed68b-ac85-54d4-86dc-116f6507bc0a', '1017619-05.2023.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5be7ff06-3068-5498-97de-9ef7c57abfed', '1004675-29.2023.8.26.0407', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3015034c-5cb4-5556-b8fb-67008b4efecd', '1020343-64.2023.8.26.0011', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8519f3ed-16f9-5046-901a-1c78f7074e28', '1169534-13.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('03a5a8b5-96ca-559f-965c-8ccd2cb290e7', '1031925-85.2023.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bd300a58-b9d9-5781-9276-c96e2c2d48d3', '1030534-89.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5c310282-15f2-54e4-b61d-37510724c598', '0037455-72.2023.8.16.0001', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8332ab4b-73d3-5973-9de5-951f9b49aeb3', '0009719-95.2023.8.16.0028', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('25cdd859-4158-5dea-b90e-bd3bf535861f', '0079471-02.2023.8.16.0014', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('925dbfec-502e-56ee-a004-90a29f548207', '0018817-91.2023.8.16.0194', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d7a9bf68-3f3a-58eb-a335-22157e67d40f', '0826927-14.2023.8.19.0210', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0f39ceb6-f88c-5986-988d-0831c175af3b', '0837879-55.2023.8.19.0209', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7cff3ca5-58d6-5e25-b9f6-c7b469ac56bb', '0909341-28.2023.8.14.0301', 'TJPA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('42368582-b7ce-5c46-8e8c-fa8d4cca4529', '5005863-88.2023.8.21.1001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0cd4f063-0a8e-5e5d-b276-d820fbe60bb7', '1056128-69.2023.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6a2e648c-355b-5e0d-b8d9-a7bdd39dd0a6', '1005104-40.2023.8.26.0457', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('04333f5f-abf4-53c4-a24e-6a9db9b43df4', '1014242-73.2023.8.26.0152', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8f62a40f-e01f-5583-8402-0f36f2d1d79e', '1024086-02.2023.8.26.0361', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dd45e332-bcbc-5560-b998-1b1e0bd693bb', '1056170-21.2023.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8df05171-ba48-51cc-816f-0d98f5856708', '1032593-52.2023.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('21343fbd-e15a-5277-a58a-fa3bca518b4d', '1171933-15.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('527d18c3-fec6-51b4-85db-956bf6b6cf60', '1016005-56.2023.8.26.0590', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('323551f6-0e32-5258-a14a-76ac6fdfde0e', '0003125-78.2025.8.26.0590', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('79e77cf8-4ee6-5908-a29e-c3db87674a74', '1044648-45.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6764730d-82de-53bb-8893-49b18c01d354', '1031123-81.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d4bbff60-d4c9-59a4-8122-fff0923d1472', '1038641-94.2023.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('febb13d9-9865-5147-81c2-2ef0dddcd6bf', '1024850-47.2023.8.26.0309', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f072f36f-0738-5623-85d5-10d3d5b1e540', '0013944-78.2024.8.26.0309', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2e0e0712-3141-5c69-848e-b79c9b46d661', '1044751-52.2023.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bd18c067-f86e-5b31-ac94-d75bc7bf7fcd', '1103213-96.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('157a2a91-7f2d-5e3d-872b-2d15e862e7d4', '1003851-72.2023.8.26.0471', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e3907f4c-b499-5dbe-b3b7-7435305782a8', '0752861-82.2023.8.02.0001', 'TJAL')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f2473061-ae0d-511c-a0ea-c7f546dd52be', '5005412-52.2023.8.13.0042', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a88c93bc-ebff-5d71-8199-d67e7cbc8cbe', '0858655-58.2023.8.19.0021', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e74195e1-bbc4-5b67-ba3b-2d030e43d4ed', '5038186-83.2023.8.13.0027', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7efd3881-6321-512c-b357-29d38fa664b5', '5016914-30.2023.8.13.0707', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5a2cfd7f-b2ca-5efb-a6c1-5ae4eebd4f6a', '0156111-72.2023.8.17.2001', 'TJPE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2ce210ba-2343-51c3-b1eb-fe32526b216b', '0039275-73.2023.8.17.2370', 'TJPE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9d1bcd69-cb12-5274-af9f-d4a66da15f86', '5115236-94.2023.8.24.0023', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9315e020-38bf-5011-be91-403641023712', '0819090-68.2023.8.14.0040', 'TJPA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d6a114e0-a217-53b9-8fb1-0910ec562d01', '0845920-29.2023.8.19.0203', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('05e175ca-84f7-5a10-bd33-92a5fb599cb2', '0963537-34.2023.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2ebcaf2a-c1d6-5cf1-bf80-183e5c7c1c90', '0813900-25.2023.8.19.0028', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0df7e04e-fee0-5cfe-8842-7c36797eebeb', '1175818-37.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ba6d3e89-48cf-5ee2-b337-a70f198c0f9b', '1013628-64.2023.8.26.0606', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('08010f63-70ba-5d7d-8faa-325e90cb1249', '1040742-29.2023.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('881d792b-49cc-586e-bad2-abbe301c1e24', '1175925-81.2023.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('45c15a84-1809-53c8-8944-d84ba176fc31', '1004655-81.2023.8.26.0619', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b479e7d9-fd03-52e4-aee2-34c46e5f4e4f', '1009898-72.2023.8.26.0597', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7889ccec-1a9e-5c29-8d88-361318b561e0', '1022625-96.2023.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5a972c41-9f7d-5dc8-b743-b534118983a8', '1033293-28.2023.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2dce7869-73ef-544c-8f7e-9501849848cf', '1002020-34.2023.8.26.0553', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a266b37c-18f7-5811-b53e-b1288b11ebb0', '1039306-13.2023.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cdb1030b-78f6-51aa-8183-8ddeaa6c495e', '1003183-68.2023.8.26.0288', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7c40baae-a050-53ad-80a8-ff1832c77749', '1010727-51.2023.8.26.0048', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ea45eec0-8a83-5479-a182-2c94d7fff8d4', '1017175-60.2023.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cd91ecd7-6044-5bb8-b491-bb3f2de58602', '0832867-75.2023.8.19.0204', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('192a8d05-3dcf-55e6-9797-c38bc26b06b9', '1001809-13.2023.8.26.0160', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f1c2111d-eaf3-5de4-a94e-6268f1ae53a9', '0965342-22.2023.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9cb2e020-9146-5587-9f1d-996519bffb0e', '0827865-09.2023.8.19.0210', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e997b1a3-a433-5cb5-b5c4-1fd228cca381', '0813621-54.2023.8.19.0023', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fd08f267-33ac-5cfb-b31b-6459350a7368', '0831997-18.2023.8.19.0208', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('22cd3226-b363-54df-bc9d-15be201789ff', '0965463-50.2023.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ef096943-f022-514e-8016-c0a21815ac64', '0751472-24.2023.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a7107e9f-eaab-503b-86b3-2bbc93719011', '5001028-57.2023.8.08.0051', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('08d3cbef-f999-5742-9cf1-2e4b4bbffadc', '5032977-11.2023.8.08.0048', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2a311b8c-cead-5f89-94ba-f759dab08c40', '5032981-48.2023.8.08.0048', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7b51a1fc-36c3-590c-a9f0-0d4dca80ad20', '5000047-14.2024.8.08.0012', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5bc2b779-7262-5fe8-b3af-167baf6b5b89', '0001230-19.2024.8.16.0001', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cd0a9f53-47e4-5e2f-9010-89bfc162c402', '0001386-50.2024.8.16.0019', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a8c4dc96-beed-55b4-9dd5-8fcbcd83c60f', '0000792-97.2024.8.16.0031', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7fde84d1-a209-5f01-a3a1-aea603c27ea1', '0001269-16.2024.8.16.0001', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('304ee3bb-95ab-51ad-9ee9-6a806c12c133', '0001244-03.2024.8.16.0001', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('48424f2a-9dbf-5a02-9be7-91571f2fc6e6', '0800484-32.2024.8.12.0001', 'TJMS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a92bf330-4381-5674-9465-18b31ce5ef05', '0800005-74.2024.8.12.0054', 'TJMS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c780c46c-0c09-584a-b675-948aee8c3306', '1005126-68.2024.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ddcfd6cc-0173-51d7-bc40-4a543a7ae295', '1001054-26.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f2edaa3f-5a19-5e46-aaa2-013b757c0ed8', '1106901-66.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e3d83ce2-e6b8-538e-8f17-b0d88cb25991', '1106934-56.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('22c78266-29cb-524a-90eb-00c594ded0e8', '1107542-54.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('989a6ef4-c5d1-5b54-a354-d1de509aa760', '0006461-11.2025.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a659bccc-0f73-53c7-b65b-0817df68a6bf', '1034116-06.2023.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('86c18b7e-22bd-5afe-94fa-6f30cbd2d2d6', '1008123-12.2023.8.26.0568', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('14e3b612-039d-57dd-b73f-c9a8f348064d', '5010848-86.2023.8.13.0625', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c3643722-5492-582e-b200-fb3d27775b1b', '1040464-06.2023.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1c4abec0-06a9-5df1-987c-3e8fab6ff6f9', '1107546-91.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7ac42595-1fa0-5f6c-b66a-6b20def791d9', '1032520-78.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('efb9c48a-f85b-5d88-814e-159b60348c2e', '1040472-80.2023.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1620f68b-7db4-51f8-a773-7f2b16dff77f', '1000933-10.2024.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('69eeaab9-d2f8-57eb-a0f7-d6062e5042a9', '1000050-37.2024.8.26.0529', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('10feca2d-7efb-5b8a-b5ba-e57fa199a296', '1000191-70.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2928d13d-9056-5154-9f09-6683a4983da8', '1000085-05.2024.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dbbb6726-ab0e-5434-96f4-67e9418d1c32', '1000132-43.2024.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6b4b8387-5d83-5b65-b30e-0975bedfaead', '0001575-12.2025.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b6d05a61-af64-575e-85de-6e10f0fcb1ab', '1000284-33.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bd5b929b-aac2-567d-a736-e129fb1d6c87', '1000450-35.2024.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e32ee7de-ec73-5bbf-879b-9dbff64c6cde', '5000027-96.2024.8.24.0070', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fe7397b6-e7f3-56e4-8612-a83eed710cce', '1000476-69.2024.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7e6561d2-688c-5a4d-8bce-a9ea32bc7417', '1000133-66.2024.8.26.0266', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b0ee3ff5-6127-58a8-8c35-fc0b1670f3d0', '5006512-62.2024.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('13cb6148-d1ea-5d9e-b00d-e40d918c8704', '5000061-58.2024.8.13.0432', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('69842646-c691-50e8-a782-1097c3a33f87', '5001745-07.2024.8.21.0008', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('284a389f-3806-5760-870b-f784065a0fd8', '1000212-55.2024.8.26.0198', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b185ec34-0909-57c8-a528-263cdbf62e50', '1005116-24.2024.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('586a6eb1-dcc1-5a1b-ad1e-56f2d56bf56f', '1000483-58.2024.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b536fddc-00c0-5aec-8be7-9d9a2400667c', '1000254-73.2024.8.26.0176', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('edfd4fb2-5710-54b1-b224-94a67a19327c', '1001000-75.2024.8.26.0196', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2a00b664-7ceb-569b-8cc6-6b2536c35916', '1002857-59.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9b1aac77-f1f0-5cff-a16b-895266ed1c65', '1000456-03.2024.8.26.0127', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3489afd9-c7b1-5346-b03f-c393680eabec', '1001007-67.2024.8.26.0196', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('01aede9e-2782-5682-8f76-6d601fbaf7e0', '5000469-45.2024.8.24.0011', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('77f127e1-0bfb-53b2-9704-ccdd7abe6e09', '0001372-23.2024.8.16.0001', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('99c29bb5-75e1-55ee-9127-fd3beb10d054', '1000631-60.2024.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e19a7522-4375-5ad5-935b-e4295f4f4263', '1001304-67.2024.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a9b7ba5a-97e8-5b94-a26d-757294d1e49d', '1001680-45.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9e9b167f-4452-5b5d-886c-d3ca02126588', '1001152-22.2024.8.26.0068', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('defd8e3b-feb4-565f-a8fd-5f34db072a65', '1000939-90.2024.8.26.0011', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('64eb87f9-46ac-5a92-95e2-a8e32e9c94f5', '0003820-57.2024.8.26.0011', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('eeca88d2-ac31-59c4-a3c6-e3ada4d2084c', '1004635-64.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2ebfd228-4802-5f1d-987b-d5a323c0e15e', '1002090-24.2024.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c6586035-0fd1-5ff2-87bc-bf45271d6e14', '1000286-33.2024.8.26.0191', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('43ce66b8-8b13-518d-a1f4-114e863148c7', '1001635-43.2024.8.26.0071', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('02abf1d2-e2b9-5eec-81a3-9ec0e0ed8ed7', '1002239-60.2024.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f8327cd2-4948-5fdc-821b-570200ff144a', '1000277-38.2024.8.26.0299', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8de64e8e-b141-51ef-9df2-b8ce4bcc02d4', '1000926-64.2024.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c364284e-5654-5d58-bad8-39677f21ebf3', '1009679-61.2024.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('830642c6-eeac-5be0-a3f8-1692970ca272', '1000221-17.2024.8.26.0586', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b2e0067e-3070-5c8a-abf6-fd5a86caf13b', '1000699-69.2024.8.26.0248', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6c1a35b1-08e1-5143-bd0d-96e6f9b79888', '1002136-13.2024.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6c044c9d-0c5f-59f8-a9ec-9da88d9e1c18', '1002654-13.2024.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9053e054-2911-5d4b-9688-08f9fbde6cad', '0000719-46.2024.8.17.3120', 'TJPE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c417c2d9-cbba-5e52-b462-943361c3a555', '1002754-65.2024.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f3e21489-88d4-51b1-8221-9ca7cd93fbc7', '1002372-05.2024.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f9cf6618-fab6-598d-bbb6-9462251c5af1', '0005409-23.2025.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bd6a9596-9694-597e-8d3f-a154be8a6f8c', '1000455-62.2024.8.26.0565', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2a1b1223-e20c-5ee9-b62c-7c9c667e8ce1', '0001880-10.2025.8.26.0565', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('867277b6-e424-5748-a8b6-19a649c03e9e', '1000513-64.2024.8.26.0048', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('92158da1-a496-5932-ba56-cae13cc2c390', '0002450-29.2024.8.26.0048', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('25af3d15-2b6a-5df9-9caf-a415e429e2ac', '1001947-84.2024.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5149a43c-27d4-588d-b55d-8cf3659049ec', '1000985-39.2024.8.26.0477', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('35b7eef2-2fcd-5dba-abb6-f61ecd7589cb', '1001734-19.2024.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4d782ba7-98b2-5a68-8c7b-689a61caebf6', '1000794-18.2024.8.26.0566', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('10ea7f18-a908-5823-a35d-50aa6106228d', '1002850-80.2024.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4968e1f6-466f-5046-9acf-11d5e24b1705', '1000232-09.2024.8.26.0081', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('51d09e8f-9e80-5cc4-bd12-851df3963d30', '1000888-94.2024.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c0efdc86-f8f4-5bef-9e20-2cff676668fc', '1000529-87.2024.8.26.0704', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1c159f05-3741-5311-9624-69bca6c234aa', '1000593-32.2024.8.26.0079', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('df9ab574-59a7-51f3-82ca-e640caf7af05', '1001037-48.2024.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('425166d0-870d-513e-aaef-0fbec3a5754e', '1000704-06.2024.8.26.0438', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f728368a-b905-5236-a43c-018f0969391a', '1012244-95.2024.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2220ef92-4155-5b93-b40d-c882a48d96cb', '1000317-15.2024.8.26.0236', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f339c312-6f5a-54d2-8f5f-59b84074babc', '1002160-98.2024.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a848349f-3474-5c82-8e22-2b3a931a29da', '0003437-35.2025.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dcb2330a-970d-5a13-b31b-02f39edce69a', '1002932-44.2024.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('eecda4a3-2afd-56c4-bd29-5c9e2e841dff', '1001380-92.2024.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('acb58967-39ee-5f85-a169-2ff8c661b567', '1012570-55.2024.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('84ec5e37-9e53-5920-973c-b4875e7d7c2e', '1002092-81.2024.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8bc1c5f5-d2aa-5f8e-8674-a271fcefde0b', '1000969-68.2024.8.26.0127', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('83a34eb7-84f2-5a47-b678-18c737e26ba2', '1003952-79.2024.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f1dd6210-7b32-53e6-856b-c5252d4d4584', '1000466-70.2024.8.26.0281', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ae2814e1-7bbc-5c4c-bda1-2d1f986ef4fd', '1003976-95.2024.8.26.0506', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('983aabef-6aa0-5826-8bf3-35a796bec352', '1001482-17.2024.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('460dbb0d-b104-59ce-8a4f-abcba4f37cbe', '1000967-26.2024.8.26.0248', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c472c0f5-a46f-5c9a-8596-b346cdc7909e', '1002913-95.2024.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('452d235b-db82-525f-99cb-571f87c665f3', '1000426-67.2024.8.26.0191', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6fa99acd-ce11-5559-b15a-0f8517b180d6', '5071878-98.2024.8.09.0011', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e24670bf-d604-560f-adab-5091e324bf38', '1000276-23.2024.8.26.0115', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a27e30d1-1885-5d47-9d33-24ec27b197b4', '0000826-98.2025.8.26.0115', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1fdf0173-0ad1-52c9-a75c-89cf8e92e158', '1004371-60.2024.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0632ee61-cf7d-56b8-9232-2f8fb07e34a5', '1000675-78.2024.8.26.0268', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6f57ee2e-e3e8-5eea-a448-f7e9882cd3fd', '1007592-38.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4e56d2a7-7e48-56c6-9e47-279a9b624a3c', '0014763-63.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('77eb5193-0f22-514c-8804-d8a62fcd34f4', '1001313-15.2024.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6b6bc1b4-44f7-5d31-b12e-0a5fe5f490de', '1002933-38.2024.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ff3e7f61-0f83-5323-9306-e0f30c50c55c', '1001716-75.2024.8.26.0011', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6c1b4ae2-299f-5f9a-a84b-cc58eaf8aa42', '1002866-81.2024.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('afb2a97e-b410-5d63-a953-b28b4a7295d0', '1001157-61.2024.8.26.0127', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b25c9fa4-30fc-5fba-aa2d-a385a7d748b1', '1001622-39.2024.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0fb61e34-0b6f-500d-b6e7-2d604e622559', '1000449-79.2024.8.26.0363', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8d28ae17-7db9-51e0-a6d9-2c5fa7cac14d', '1002122-37.2024.8.26.0451', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cfc52dfc-f124-5c74-9d4e-a3175e410647', '1000111-86.2024.8.26.0531', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('158dfd8e-488a-5829-b73d-b9665bc7cf02', '0006588-23.2024.8.16.0014', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ea01897c-0dd4-5b3e-b0c8-7dd79266fd3d', '5076081-80.2024.8.09.0051', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('859c9471-b4fb-5098-b1ce-b60a312de68e', '1000936-65.2024.8.26.0099', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f1b95e3b-0d24-5489-a11d-01ffa34aeeeb', '1002799-53.2024.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5aeb0bf2-bf89-578e-9a7c-bfda44d263b6', '1000481-18.2024.8.26.0191', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6f2f363c-417f-5abe-99b7-f64a4485e83a', '1001100-12.2024.8.26.0590', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2cc30fb0-ab8f-5235-b9e1-43869ad1ef7d', '1005078-39.2024.8.26.0576', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f06598a5-63a9-5e23-8272-571b6f3fc859', '1001186-09.2024.8.26.0161', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fc8ed8b5-0d90-5e4e-841a-f20b7c505139', '0011056-95.2024.8.26.0161', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e897e261-f236-58ae-aaa7-3a6b4c792a22', '1004839-24.2024.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7c27762f-59fc-56f0-be76-8b3035216eb0', '1005454-41.2024.8.26.0506', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9cedc274-8abe-5d56-85e4-1c7aad7cbb75', '1005645-70.2024.8.26.0576', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c42cb6c1-40ea-5ecb-b8b9-790e115991e6', '1003177-09.2024.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5444f533-0fc9-5d36-b31e-2a22a6e79f3f', '1001053-56.2024.8.26.0099', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f19caeab-c08e-536a-859d-3ae54099a602', '1003465-12.2024.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f3cdb08e-d6f0-5c79-85c0-3f9582569787', '1004017-25.2024.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a4a6b76d-7a81-5921-a14e-34645d6fc949', '1001037-27.2024.8.26.0609', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('337600b7-ddf3-5021-b6e3-0147c0dc3b54', '1000333-98.2024.8.26.0581', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7f79f9c8-0118-5267-8192-875ca449fc23', '1024377-72.2024.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c2226b77-1be6-5d3e-a74d-c57ba546a3e3', '1007269-85.2024.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d1f294ca-8d9f-5f7d-a2db-4e65864f7fba', '1002623-50.2024.8.26.0011', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4d55935e-207a-525e-961d-b5f0d6894afb', '1004153-12.2024.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('62e9adbb-c2d7-5c96-873e-b34fe59df1c4', '0005814-43.2024.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('75e28fe1-4811-550d-a535-9c99a4e72d18', '1004241-54.2024.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('92faa5b2-0c14-53d8-b381-3e75b8ee0b43', '1003821-21.2024.8.26.0562', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ed11713d-751e-5c1e-b03c-468615892997', '0003666-98.2025.8.26.0562', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d1241927-9371-5778-be55-e28ebd6ef519', '1004679-46.2024.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5f12c9ed-a381-5bad-8bfa-ee123160004c', '0005547-41.2024.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('141a1a4d-ae18-5c14-a93f-bb386477b2b5', '5036883-09.2024.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('aebad038-655e-5ec7-acd4-bb934bc3d0ec', '5037027-80.2024.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1c2f609e-7d56-5a72-ae2e-32390e577b5f', '5003163-22.2024.8.24.0064', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4087a9cf-de82-5cb7-9af3-45af0afc9c37', '1004666-69.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('84a906ad-ac17-596e-967b-59df1537a772', '1007193-22.2024.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ed00eb17-833a-5bad-abba-0c9635b8b1a1', '1007679-34.2024.8.26.0506', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bef25ba0-6bdc-5553-8b2c-170d211e1005', '1004254-49.2024.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a2973e4d-231c-5203-9212-16f4406195a3', '1004759-02.2024.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a05645b6-100c-5a3c-bb9c-e40d2f3d1303', '1001327-48.2024.8.26.0704', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e035f2bb-2953-56ab-938d-40e6f891fed4', '1001896-75.2024.8.26.0566', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('13766256-3a4c-5a96-9fb5-a503f412334d', '1002702-38.2024.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6bbf8683-0967-576d-88e1-9a823d673963', '1005743-34.2024.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c287b62d-3c64-5773-b9a4-3a858a16ff5a', '1002096-59.2024.8.26.0606', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4129d00c-2605-5a78-b7b3-dcdbc5013d51', '1002466-83.2024.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f559993e-8d6e-5bad-8832-2deb6512cf14', '1004116-41.2024.8.26.0309', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('619b97c8-eef1-5852-87cc-d797f71ab79c', '1001616-71.2024.8.26.0286', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a6d199d7-6a81-504b-ab57-5d44a9acbc95', '1005999-56.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0ad16417-fb5e-516f-bcc4-caf81abc8119', '1004982-90.2024.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e30a1441-e9a3-57ab-b8f6-cb0f206c098a', '2109464-85.2024.8.26.0000', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3b44fcce-762f-5399-9c31-528d0fc485fa', '1002531-78.2024.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9044495c-eb60-51df-b86b-d570446c6c78', '1005004-55.2024.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fa72759f-ce4c-527a-9c35-8adf78887ce5', '1006140-75.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('247658d2-8ee9-59cd-87f9-0ba953ccc49a', '1001120-02.2024.8.26.0073', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e66cdc3e-2c14-5fb3-a72b-53f07ae13db7', '0003626-65.2024.8.26.0073', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('63db59c5-e911-53a4-bba6-dca4a2aea865', '1006157-14.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('23213b94-7d26-5ff0-ad65-76d7b8dbe0e8', '1002955-87.2024.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a8ed0123-52c6-56a9-bd08-10605ea66e29', '1000250-64.2024.8.26.0102', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7a322779-a058-5ede-971e-dde9bfe37825', '1015272-74.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a726d344-82e6-59ac-a496-0b2885b0554a', '1002437-92.2024.8.26.0248', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a933d596-975a-5f43-9590-68b75b623ba7', '1008178-78.2024.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e7b3d45a-de84-516c-90ae-48b639574d7a', '1001338-85.2024.8.26.0281', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('95788c43-ff7f-5173-a7ab-766fc48758d1', '1019026-24.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e4264907-c4db-58db-a794-416e5c0587f6', '1002447-23.2024.8.26.0609', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bdedb8b7-3450-5ddb-91cf-cdecdce94327', '0801830-12.2024.8.19.0037', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('31f3658a-844f-522e-ac23-8e1ee136deef', '1016317-16.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('90d39986-e8df-568e-b1e3-11f3976f02c2', '0002342-24.2024.8.16.0130', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3056cede-099e-5bfa-b5c8-66686414da0f', '0708413-49.2024.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('270eb52d-0c65-5299-b2b4-9f1119f9ec16', '1001518-41.2024.8.26.0010', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c5475108-1cbe-5b07-a1bf-9e5c07e2c938', '1004991-50.2024.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ab3e2c74-c761-54a3-bd24-a5c4c2e9f1d6', '1005502-57.2024.8.26.0196', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9537823d-8b86-58c2-baa4-94991ef98a79', '5013252-39.2024.8.13.0702', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c6e9ef33-a52a-5f6f-a090-3c49982af3c1', '5003372-08.2024.8.13.0707', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('832b021c-62c6-537e-8235-1defa3ff40c8', '1006411-54.2024.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('01d239b4-c512-5b26-a5eb-aec3a99e1ea1', '1034455-28.2024.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('03a66233-fb8d-5ee3-83c0-a8ab597882c3', '1010748-47.2024.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8ccb18ad-df22-50e0-be2d-826bbaec7460', '1006148-60.2024.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bfc9f365-3c53-51f8-ab9f-c47ee39e2a47', '0802180-25.2024.8.19.0061', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1296216c-ddd6-5aa6-8dd2-ba8648a5f15b', '1003787-23.2024.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('206288a2-b91f-50b5-afd8-183a860f641b', '1001738-39.2024.8.26.0010', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('41b3f508-6de5-52da-a061-2af069516c40', '1002120-84.2024.8.26.0704', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5f8c647e-47fd-527d-a610-c61861083230', '1003332-03.2024.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('613e9de3-65ea-58ca-be10-8d0398176645', '1008028-79.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bff95d2e-d3db-5a8b-bb82-54c1f21e5e43', '0000622-15.2024.8.16.0100', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d79dc396-0a42-5735-a16d-05e85e54e3d0', '5061728-08.2024.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('43821b8d-8ea3-51ee-95bc-7f9c492caac1', '5010164-15.2024.8.13.0145', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fc1d32e5-3e71-5563-8156-d4f1f34e2872', '1003499-24.2024.8.26.0037', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b6cadeea-91ec-5cee-8f71-0b9d844fe5c8', '1004031-49.2024.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b7baadc9-ee7a-54cd-a92d-f168e5e5f149', '1000295-43.2024.8.26.0660', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f24ac332-0a60-5698-942f-df68101132f6', '5191576-45.2024.8.09.0158', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('00ea9989-b929-5012-b065-100b95305bf3', '5190655-19.2024.8.09.0051', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d67aa9a7-da0f-528f-8969-70757f6a9f86', '5193906-45.2024.8.09.0051', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('87e3aa28-ade1-54c7-a8ea-7d5b0dfb35fd', '5001045-31.2024.8.24.0078', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d3b9883c-1ea1-5aeb-9144-6c656311c7b6', '5009145-30.2024.8.21.0022', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e783d63e-846b-5514-8d26-cf0e2f301c07', '1022014-18.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9d4391d0-0492-5dd9-8142-60e9440aae07', '0035409-94.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4715cc88-c26e-54e0-a095-b000fe912962', '1002508-91.2024.8.26.0637', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fd31db1c-24c3-5b47-a346-4b3ffe9aed78', '1015050-49.2024.8.26.0506', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('173c429f-a24e-5b2f-a583-b5c4c33bedb8', '1009620-79.2024.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('281ff31d-b4cd-5c96-a92e-cad103403452', '0809422-76.2024.8.19.0209', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8262b4fe-6072-58ed-af45-c8e2175452ea', '1001468-11.2024.8.26.0270', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8e5589c3-4ab6-5eab-a8f9-5d1a2bbc7f7e', '1009985-18.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e5755882-da18-5c4c-aac1-027775890597', '5001208-02.2024.8.13.0180', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0898711d-f83d-5f2b-a783-c247f4671e5e', '5079208-96.2024.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e4cfa33e-1e8a-5fb1-a742-40d01e776f18', '1010811-44.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dac2ba0d-8d37-59af-a8b3-faaaec2d593c', '1008036-71.2024.8.26.0196', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a99538c5-df4c-5ff8-bd68-5450667aaa64', '1004190-75.2024.8.26.0348', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('15c4b3d4-0cc4-548a-b653-024590e26df4', '0002039-22.2025.8.26.0348', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d063abd2-a42a-5895-a47b-6a9aa549a6c5', '1011386-52.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b019acde-fb10-588d-ad50-1b245a687527', '1004757-65.2024.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2dc52f26-cedf-5958-9a8c-bda413e7255d', '1004668-03.2024.8.26.0019', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c218bfbc-81b9-536b-8788-b9132481f3e1', '1011833-58.2024.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a16ceb27-26ac-570e-97b0-987a922f3d1d', '1003568-77.2024.8.26.0127', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5669d488-9231-565c-86cc-e201b478f287', '1003834-89.2024.8.26.0248', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2e487709-5ef8-5bc3-841d-71a8064454fa', '1004046-29.2024.8.26.0566', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c3302331-f6a0-597a-9983-d1cc507dbca7', '1004833-89.2024.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6f974424-8f23-56ad-a30b-f235ef211c5b', '1009271-66.2024.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5daa421d-4cb1-5386-ac68-6924654232dc', '1011588-29.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('015d3044-2049-5348-88fd-b78ec84ff2f0', '1016005-92.2024.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('73573e53-a299-5567-81e4-3dc9c86fbcb0', '1028613-70.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('86190cd8-4936-5390-adec-59f89e1d89d1', '0002712-74.2025.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4ca36d41-8fca-58cf-b520-3e89b2e500e3', '0023448-02.2024.8.16.0014', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5e487849-c784-5d67-af70-8b45d1d12803', '0010672-09.2024.8.16.0001', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2bd744f7-249b-51fd-8980-034f97d9d5b8', '1019762-55.2024.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('af81b75c-3f7b-5b49-8b29-425dd641e7e4', '1001397-22.2024.8.26.0201', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0a83149f-6082-5026-b01a-818ee7eec04c', '1005905-42.2024.8.26.0320', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('000659e6-a060-5582-b633-140a5c09e78e', '0031626-37.2024.8.16.0014', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4002be5a-6720-56ad-bd43-8022e6d8244f', '5384548-61.2024.8.09.0087', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0b850deb-a2ff-5049-bd81-df3b11c54bd3', '0811462-46.2024.8.19.0204', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('60a0c015-93e3-50c3-bd54-a44fb2ae102b', '1003415-59.2024.8.26.0704', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('515c1b0f-4db9-55d3-91fe-6298a16fd2ea', '1000851-39.2024.8.26.0177', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c7d72f3d-bde8-55f8-8061-e82a81b355ce', '1008750-04.2024.8.26.0011', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('39e81315-e517-5854-9ca9-776b85692a4c', '1007518-69.2024.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7dd3e022-ced0-5ed4-8c21-2ab28644fbf3', '1045913-45.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a7a63c13-a281-5aab-81cb-402b81b0295b', '1007171-56.2024.8.26.0161', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b12b1e65-586b-5248-9c08-7e22838245cc', '1007550-35.2024.8.26.0019', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a80505d9-c830-565f-9fbe-7f8b79700dba', '1004081-03.2024.8.26.0529', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('04d973d4-f34f-530b-ae79-e648836dfc7d', '1002136-80.2024.8.26.0108', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0c2bce23-4c63-5b60-adff-7dbea2091da7', '1005235-33.2024.8.26.0278', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('24ddf8c1-a893-515f-9422-ed4e428c8bd7', '1008837-30.2024.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('50eeb1a8-ef7e-5381-a6ca-c08e29f7878f', '1047429-03.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5eb7f146-977d-52f7-8264-68f4d28f0b98', '1003041-51.2024.8.26.0281', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a218b374-9ffe-56e0-b57e-2de0d99cf733', '5136127-08.2024.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9bfa18c9-3b46-5e33-91b9-cf78f6c18b1e', '1002073-61.2024.8.26.0106', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4c4411da-1133-5b55-a980-bf010b382dcd', '1087943-92.2024.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fa340741-c58b-5aa5-b8cc-a40225382a52', '1008902-25.2024.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2035d4b1-2212-5346-8229-8f006c494a3d', '1003111-47.2024.8.26.0191', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fa349666-cda6-5939-9a46-a2fd38c6e079', '1002484-12.2024.8.26.0363', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('324abea6-e40a-56ee-a5ba-39a59904f840', '1005133-91.2024.8.26.0704', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('664a985f-0250-5f6a-b73f-b1a68c614e16', '5007664-83.2024.8.21.0005', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1acd6b0f-1bbe-5ac1-8ae4-6018fad37818', '0812574-44.2024.8.19.0206', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cecacbcb-e60e-5ebd-94e1-9678e85954d1', '1013925-94.2024.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ac7167ec-8f10-5f6e-87de-be9f390a780b', '1013930-19.2024.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('03576a19-5eac-5e65-a79a-957d44a05997', '1002785-50.2024.8.26.0462', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('994dccef-211c-5588-a19b-23f2b3f13ddb', '1049015-75.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('70181bb4-5692-59a7-9459-be897d2479c0', '0823667-34.2024.8.19.0002', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('82829cd4-d3e7-59c6-b298-0498aded65b5', '5011474-08.2024.8.08.0012', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f5196f41-13aa-512b-aaa5-7561b1799668', '1005774-88.2024.8.26.0604', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9ce6ef3e-108e-568c-8841-b4ce2a697833', '1016916-07.2024.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7156fe62-3fe9-5141-bdcf-4cc65791f50d', '1049899-07.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b9973e24-526c-5ced-9bd2-5ec9a17d0b14', '1005784-33.2024.8.26.0637', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7db964cd-675b-5e92-9f1d-576fbf171135', '1016922-14.2024.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bbe9c2e9-fe97-58d1-9fb3-37c3f91096aa', '1021294-54.2024.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('21ca813e-9249-5a82-9a49-75aa9dbf7dc7', '1050970-44.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('92dcb6b2-7539-59e9-b052-3d4141a86314', '1014983-35.2024.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c33028e9-acdc-5ad7-a176-c5f5240776b8', '1095532-38.2024.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4cebd2fd-35e3-5bbf-8cc2-1dfcc056f770', '1051438-08.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('38e1ad44-b098-59f3-9ae3-ecf01ab10b9a', '1030253-24.2024.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('125b1ee4-c9cb-50e0-a3ae-5bf6da70b286', '1017273-29.2024.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2320474a-c7f2-5cd0-bfb8-14b414e37d42', '0836616-88.2024.8.12.0001', 'TJMS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('69fb3f8c-997d-5672-9292-8326ad555b66', '1052349-20.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f42f4da7-627c-5bdf-bc77-0dff1afc76b6', '1002552-21.2024.8.26.0505', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5f211ea7-4615-59d8-a435-db33d2a52af8', '1053727-11.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b5a01d9b-5c06-540e-b367-a783e75f34ef', '1031648-51.2024.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3baa6e32-1d9e-5b83-b1a5-f96a9043521f', '0007822-76.2025.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7a5c2c9a-5a63-51ca-8cd5-ee8d6e3e92c1', '1009068-02.2024.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b8d6e67a-6527-5e73-9c36-34de9ba1a5cf', '1053956-68.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('df4acf01-bfcd-5dd2-bcdb-ded8f3fab264', '1017778-20.2024.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('50099449-222d-5a29-afd0-59ed19c66a59', '1006883-31.2024.8.26.0510', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('58ba4906-c17b-540a-b546-49b76d33faf5', '0001508-32.2025.8.26.0510', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8e7d1168-42fd-55e1-8693-1e37a9cd77dd', '1054996-85.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bfdf5e01-4396-53ce-acee-7024a2d7b77e', '1014461-66.2024.8.26.0309', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8bda2f2a-00ed-539b-823e-a09af1408e72', '1016455-71.2024.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('179124b4-701c-5e3b-858d-12fc5d8c5ad7', '1053872-67.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4bc9ec7b-4fce-50c8-83ca-37249771d958', '5012884-08.2024.8.21.0023', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('608de3e4-6f4b-5522-85fc-02c4533eddb6', '1055930-43.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b53148f2-bfc3-5799-93ab-338a316f00ef', '1011201-11.2024.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4258d56f-3a34-5a21-8e03-78a2819f476d', '1010733-38.2024.8.26.0011', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('98568671-1dfb-52fb-be8c-a1baf05c0caa', '1012229-39.2024.8.26.0032', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('00c48749-1bd8-5713-b1e6-90e63032a604', '1006358-19.2024.8.26.0229', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1ca5c0e3-eeb6-55ab-9e91-015762987986', '1007903-64.2024.8.26.0152', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d1dc5056-9d8b-59f7-b19d-69693f629c49', '0000912-55.2025.8.26.0152', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8ea9dde9-36d7-5c57-bc32-a06c56b82add', '1056249-11.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4df9f30a-1c44-532d-881f-191e7394fe9f', '0824971-47.2024.8.19.0203', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('339193b9-026b-545d-bc80-761876226822', '1031091-06.2024.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('aaca4cdf-6367-5f86-b9d8-a0c8a205d581', '1015158-49.2024.8.26.0451', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('032b17b8-56aa-521e-a612-19978e3b38ca', '1012970-05.2024.8.26.0477', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b61b8528-c604-5d56-a919-2251c7329b80', '1017214-35.2024.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0d6b0095-55df-518f-bf3f-c72ebc91a649', '0006334-64.2025.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('aec3cfc3-f809-59e5-9d81-c21e06256f7e', '1058085-19.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d0c4ae1a-27c4-516c-b5de-4f271328fb1a', '0032007-05.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('54ba9401-5087-561c-a33c-32ba3d4e1956', '0017483-34.2024.8.16.0017', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a748c033-2a6d-5560-a8d3-1d4dc8e751b2', '0027399-80.2024.8.16.0021', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2d8c369b-d9b4-5934-8c6b-8d4a48021f1e', '0801203-82.2024.8.12.0043', 'TJMS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fee6a6cb-2172-5ca8-b746-4f80a326a3e7', '0811853-21.2025.8.20.5124', 'TJRN')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c7b520da-254c-509a-9880-d4c8148744bd', '0728575-65.2024.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('52a7c981-e649-5bec-a917-a589bdf9c570', '0728599-93.2024.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7410bf3e-465d-53e0-8b67-62f20b15d473', '5687167-96.2024.8.09.0051', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8988597b-13f0-5a00-bc84-87beddc9cc8d', '5687280-64.2024.8.09.0014', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6d9276e2-7cac-5320-b3d8-2fa7a582d891', '0891740-61.2024.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b593939a-6b7d-5524-96a3-dbf2ef181436', '1035300-76.2024.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c9c799f2-35ed-5ddb-a879-9690d4043ecd', '1113575-23.2024.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0d4ece1c-1cf5-5bea-ae61-110e70fd724d', '1011659-19.2024.8.26.0011', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('128ac130-b213-58c6-a2e2-5f8fb60aee51', '1019900-06.2024.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c9b44888-d727-5778-b065-d2afc4ce8542', '1007601-21.2024.8.26.0286', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f417437a-5373-5e22-9024-510814771dfa', '1005548-06.2024.8.26.0565', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6eefda68-ae25-5201-9267-845d3b6445e8', '1060969-21.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d3b6a27a-7a88-5a8c-9d0f-b4737d120ec3', '0826839-60.2024.8.19.0203', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ed3cccaf-da35-589e-9931-b437f1f5347e', '5019838-22.2024.8.21.0039', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('751149de-474b-53f9-97ab-2bf0053e7162', '0717178-88.2024.8.07.0007', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cc055547-f7ae-55d1-aca7-5a3dacfd604f', '1061953-05.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c546c31c-ef4b-5df0-83dd-4041965d7879', '1013491-24.2024.8.26.0032', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('77f944d5-2ded-514c-9c57-283bed069ea4', '1006363-02.2024.8.26.0048', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e2872e8b-55d3-58bc-ac8c-e68fbb1ef108', '0001522-44.2025.8.26.0048', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('87c134e2-b325-50a9-abce-cd9dab9b6561', '1008786-11.2024.8.26.0152', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b77ba290-d540-52c0-8666-4ac8fd6e59e2', '1062506-52.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('82a5379f-46e2-5e35-9fbc-382129c30c73', '1007762-31.2024.8.26.0286', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('330682f3-e6ea-55c4-bf78-969095c7bc5e', '1022926-75.2024.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7a291e29-cc64-580a-906c-357c1d400a57', '1010949-05.2024.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('10af6cb8-44b5-5b00-9ad7-b4cedde63819', '5155208-87.2024.8.21.0001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2a4c04fc-491b-5c2a-86bc-8e16414a22ef', '1005851-23.2024.8.26.0176', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('13d42f50-9f2e-5ecf-8eef-380c9a9a85ce', '1019198-54.2024.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f04260f0-9bec-5eca-bf98-ecbd2b4f4840', '1006689-59.2024.8.26.0048', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cf0b61c3-c7d0-5d27-ac2c-a72bc28ddab3', '1026972-32.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2acb49af-1add-5bb7-a68a-acac24c5c288', '1001759-80.2024.8.26.0150', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('830e93b9-426d-502a-8f1e-2f5787c8fdf0', '1023413-37.2024.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('43ca2226-144d-5e2d-bee6-e0ff8006bd4f', '5040565-98.2024.8.13.0079', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2d748ea2-ede9-5727-adaa-7738d496ea34', '1011622-07.2024.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('122ebf84-293b-580b-ad1a-d6551b96e75e', '1008704-64.2024.8.26.0609', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('caaadd23-b5bb-570d-b624-2e69c0696a67', '1028204-79.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('211555ca-b5ec-5fe5-9df9-59764afcdb04', '0009459-51.2024.8.16.0038', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d05aa086-7c93-52a5-9160-3e2d0aa3f662', '0088857-48.2024.8.17.2001', 'TJPE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bee3acde-7d9f-5522-bf56-54d4936b9cba', '5017963-90.2024.8.13.0313', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('09d31f6a-a3c1-5c52-abcf-45a7415cf98f', '5020544-65.2024.8.21.0019', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b27c7259-70b0-5466-adf4-bb497d63f672', '5025549-62.2024.8.21.0021', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2e1587ba-6175-543d-ad71-ffe0249d682f', '5010982-74.2024.8.24.0075', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('181fd74d-3362-5a39-9599-3142b0cb68e3', '1007426-34.2024.8.26.0704', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9cd3b7dd-11b4-50f6-a1ec-049c1d8c9f2f', '1070313-26.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1791ad4e-4677-59a2-85ca-7ca070987dd5', '1009605-23.2024.8.26.0127', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b40a0c3c-3ec8-5cef-a2cd-11d083b63cec', '1011888-22.2024.8.26.0320', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a7f6b75d-8bfb-593c-85db-7b464de726c7', '0002957-13.2025.8.26.0320', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8215aa76-ae2d-5c6a-a8c3-e4e7f11eb5c5', '1033223-27.2024.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bbe72a41-ebd2-5b8c-8ca7-81e9c15f7fa2', '1013846-70.2024.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ed3dc4d2-de5a-5421-a2cc-afa18db5863d', '1072984-22.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6de6a81f-480e-5009-bde3-4b19e5d24acc', '0008945-96.2025.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e11ad17f-ee31-5bf3-956a-65acf4b5ea10', '1012001-36.2024.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4615c5de-7433-55cc-af9b-56177a8eec6f', '1025870-50.2024.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('45269104-ce0b-5ad8-87ae-bd0acf435a9b', '1073366-15.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('eb6f546d-8683-5211-88ca-428be4ad4e7e', '1008360-09.2024.8.26.0278', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7a490844-3c4b-52f3-854d-404815c62c5a', '1013920-27.2024.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3a9d2b92-fd68-5533-ac1d-b104bae109ac', '1073445-91.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5ff1b2c5-ca17-5c6b-9791-8f4badfab2fc', '0011454-97.2025.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('129b1073-afc3-5526-a666-94f878b10851', '1006693-97.2024.8.26.0565', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d0d96c38-cf8c-54aa-b220-ff52744a3c33', '1012120-34.2024.8.26.0320', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('53124203-6f86-518a-aa7d-8acefa36482f', '1030938-21.2024.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8a7e88ca-c7d0-56f1-b650-6c76a80eef39', '1043123-04.2024.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9d3e9ec1-0f89-5b6a-9774-dfff09dece48', '1003270-45.2024.8.26.0108', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('23cbe283-7178-5b37-a1e9-ec3793a4c1a2', '1005778-20.2024.8.26.0445', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f2818560-f32b-53a0-885a-adbf67ed03e5', '1034029-62.2024.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('130f4f36-2530-5c9b-99b5-23b8f54ac764', '1011106-78.2024.8.26.0590', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9a3325b3-115b-54e6-a8d9-d770b1edc07c', '1012069-96.2024.8.26.0037', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cb0ceafe-adca-5578-bb21-3adad6f8919f', '1007869-82.2024.8.26.0704', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a33cd333-6805-52bd-9205-be5565038a12', '1138914-81.2024.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('865f5750-d2a8-5b31-b873-e4315c503c6d', '1014785-86.2024.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dc7e436a-b96d-5991-bee4-3db0ac2e0aba', '1004981-25.2024.8.26.0322', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e8332a81-6aa4-5a8c-bb83-fd9b866b5369', '0001351-41.2025.8.26.0322', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('06aaf5fa-193d-52c4-b3f0-a7ae662472a7', '1139859-68.2024.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2a10b483-6d6a-51b1-871b-82eae92037dc', '1006801-32.2024.8.26.0176', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('361aa88e-65dc-5528-92e7-d68f35657197', '1001041-27.2024.8.26.0589', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b9af253a-590a-5be3-8c67-cc931f497bd1', '0824740-35.2024.8.19.0004', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b9444473-4e9c-5a05-8dbd-deadcf34ecde', '1027141-94.2024.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ce91c2db-30b5-5b03-bbe1-7bed8b3fa722', '1009226-90.2024.8.26.0286', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3a3b39ea-4d80-5b75-85d3-5cdf06dd26a8', '1031288-88.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7b09b24a-7fd5-5de8-8711-d4eb48bf085c', '1015260-42.2024.8.26.0008', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7c2b13b4-e3f6-5f02-be06-2a6af51cffc2', '1076599-20.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('859ce506-bdbf-5965-a729-835407e539d0', '1013351-59.2024.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fdf49bf2-41c7-5d01-bd26-4253dd5f0a2e', '1029018-30.2024.8.26.0577', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('09d41b26-af6e-50f0-b6e3-e58718c47107', '1020696-11.2024.8.26.0451', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('71f58809-b738-5ed9-adf3-b0a9567c75dd', '5052043-77.2024.8.13.0702', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cab08916-fb67-5d43-86ca-e32653c051ce', '5052059-31.2024.8.13.0702', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('20762b82-5e8f-56b7-b2d1-372af98c5c5d', '5003445-28.2024.8.13.0400', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4fd75281-2f47-59ef-87d5-cfe2c8b45a2f', '1009829-82.2024.8.26.0604', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fd21d3a2-3f21-5608-95f4-c3c20e7bbb87', '1151274-48.2024.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('af312b91-08c8-5b7a-8e2f-6394caf4fa50', '1002841-70.2024.8.26.0337', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6185ed9e-0817-525a-9389-d634f8d6e937', '0000488-40.2025.8.26.0337', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('eb60ba73-d818-5551-952b-539ba8564a3d', '1026825-18.2024.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dc129392-71ff-526a-a51b-6d6b67020e49', '1013223-52.2024.8.26.0037', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ed7001dd-793a-5a82-b7a3-7c9d9a8e7c7d', '1081715-07.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1165d2f3-b53a-558a-bbaf-374f04479ca6', '0849298-20.2024.8.19.0021', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('eb258e3f-e4bf-5c33-b45f-474b4f34c9f2', '0925660-26.2024.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('89e2685a-465a-53e3-bb61-317a3faee2e4', '0821608-43.2024.8.19.0206', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('db61eb30-dd65-500f-9dd1-8c4dda0453e6', '0740646-02.2024.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7d3fb9a0-d640-590c-a749-284e2012a7f3', '5198062-96.2024.8.21.0001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b003101b-c5a7-5383-a389-dd6203a4f2dd', '5026431-67.2024.8.21.0039', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('58414d37-b368-5e89-bd3e-b35615742f06', '5018782-02.2024.8.21.0023', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('844dd138-f395-5b3e-a1e8-aa13cb756ce1', '0740960-45.2024.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bbd23d96-5f00-500e-bc9c-120f4543a281', '0741443-75.2024.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1a6f8ec0-19cc-5fe7-978a-d26fc259497a', '0811315-78.2024.8.19.0023', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('39e0c5ee-6472-552a-94f3-14bf5c43bf31', '0850368-72.2024.8.19.0021', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('09c48404-fa99-5008-a3d3-3965a3533a3c', '1044850-37.2024.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6839d770-12de-5c82-b9c3-e55e5f4c6df2', '1014019-30.2024.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('56d3098f-d146-5259-8db0-3b2bfccd5ab5', '1034677-81.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9268056e-80c8-5171-a7d0-43b11cc3afe9', '1010781-52.2024.8.26.0510', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2e2b8a24-7608-5ca9-bd54-4e69c6c992dd', '1035818-56.2024.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('265c673c-9abb-58cb-b1b8-27369193f1af', '1007441-43.2024.8.26.0529', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('23172ecc-8588-512f-a8ef-6897d77efea5', '1158669-91.2024.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e1cde952-39ac-53ac-ba0a-f5356db8c8ea', '1014230-66.2024.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fb0b2413-1c9f-59f9-9dda-a09a6e0da7f7', '1034806-86.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c6394522-a2ee-5eb1-bd52-a4fa64aa8e80', '1035987-43.2024.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('db2bcaef-47c7-5f66-b057-54e5fb9be736', '1029322-60.2024.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('371fac95-a17a-54d9-a414-15d75d8aeebc', '1013500-08.2024.8.26.0348', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4661fb12-428b-5387-8aeb-56a9edad95f6', '1014447-12.2024.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0f2a77be-5cd2-5fe8-94c4-e13d0de735d1', '1007111-34.2024.8.26.0533', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6474dce0-3ccc-55ef-b02c-113bec4188f0', '1025297-40.2024.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9cd50181-c5eb-5b3e-90a0-6f1ee2c151f4', '1028816-29.2024.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ee36bb8e-ce51-598a-8f43-72ef9daa5bf4', '1011919-64.2024.8.26.0248', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3034dad8-ce6b-5795-8b0b-8340cbca4d01', '1013664-49.2024.8.26.0161', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ed772213-7c31-56f5-bb56-753e27a07474', '1014521-66.2024.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ac8428b5-5637-5799-a2db-622b156ed5f5', '0035586-40.2024.8.16.0001', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a211ac46-3a49-523b-8fae-56bc3365ddc5', '0017646-65.2024.8.16.0194', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d8327c31-b2e9-5029-999b-e34be7080802', '0003843-03.2024.8.16.0101', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c495a92c-d8d2-5172-9ea0-b34666cf349e', '0012346-87.2024.8.16.0044', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b1ba35e9-686e-5be4-ba3f-bbf6711a83a0', '0030802-63.2024.8.16.0019', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7189428b-c325-544b-a923-69d2ad70b1e9', '0009234-11.2024.8.16.0174', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('484e466b-76b5-599d-ad74-5561efb4df60', '0001997-05.2024.8.16.0180', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8ac9f758-404a-519e-9251-dbd0d6599355', '0002255-74.2024.8.16.0128', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('256e21c0-8b50-55bd-b394-21336ce58e37', '0017803-38.2024.8.16.0194', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('49286b88-4084-5152-98c9-363c09b5f99b', '1003134-94.2024.8.26.0125', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3f199487-a83f-506c-aeb9-df93057e5bda', '1036015-90.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('86a76ede-762e-50a6-b31e-e64de8d6b991', '1048241-97.2024.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dac62b7d-c62a-5fc9-a265-e6db519c8130', '1048246-22.2024.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4f54c949-1a77-5a32-9d64-bafbb7e7e972', '1014410-95.2024.8.26.0037', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c966b7d2-4f2f-5c39-a6ae-e5602b5e3455', '1014879-31.2024.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('98df40ca-8f9e-5ee8-ae42-1af9cf8f6753', '5964785-42.2024.8.09.0049', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5e45235a-64dd-563a-b946-4b5f3fa4d927', '1037806-15.2024.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f1e823db-c0cf-50a5-ac77-ed83450eb2a1', '1048679-26.2024.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('15789940-2ebd-53b3-9ad6-79e253c4da45', '1036348-42.2024.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1b274a11-71c6-5842-b1e3-b9d41c77b56e', '1008289-22.2024.8.26.0176', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('003e6043-5a08-59da-85f4-e7d54fcc91f2', '1028410-04.2024.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c8da5bcc-42de-5e87-a980-5d2f5f099d8e', '1017405-62.2024.8.26.0011', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('06675aea-7c76-55c1-bf3b-1618a491036b', '1038178-61.2024.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('07b5f0cb-a96b-5b56-9c43-2d78edb59e0f', '1015072-46.2024.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6a2a4512-8867-5bf5-a4d8-7bc181d38f06', '1038377-83.2024.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('81b949d4-aaa8-53e7-940c-70de9b9d1113', '1011149-08.2024.8.26.0269', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('844e315f-f9e6-55c6-8988-c50e25835612', '0839290-02.2024.8.19.0209', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c1faa672-bd7f-55f0-b85d-da9b60ecefe9', '0839176-81.2024.8.19.0203', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8abaf73a-8b8b-5985-88aa-a1746efd8eb2', '0835970-53.2024.8.19.0205', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('636cf40c-d99f-5cd3-9aa5-aecbb9fd042d', '0120489-92.2024.8.17.2001', 'TJPE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1025e1ef-4532-53a3-96b3-23080cf62fd6', '5245818-04.2024.8.21.0001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b3950c9c-7bae-539c-9754-0a1fd4b804db', '5014775-21.2024.8.24.0075', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4255e47a-0930-5220-94ad-45d046498f5c', '3000552-02.2025.8.06.0031', 'TJCE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('26ca102a-96bf-56d6-a291-8df7810f00a9', '5003947-14.2024.8.13.0740', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5c5a9c6b-86cc-51d5-aec1-dc25e3f4f698', '1005728-56.2024.8.26.0198', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3789a2c8-05fa-59b1-b097-283f07f7b261', '1007552-15.2024.8.26.0533', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7727d4d5-eb96-5c53-8256-90a8d0f9ea87', '1055061-93.2024.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ac7adb4d-9840-5187-adda-7601b9106e6d', '1015579-16.2024.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('511de564-5299-53a7-8b5b-a7d145541535', '1024156-44.2024.8.26.0309', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c6bb98bc-017b-57cf-a0cf-a34a99c2012f', '1017870-44.2024.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a22544e6-036e-5fa5-b887-81308c7e4ad9', '5032547-10.2024.8.13.0105', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7fdd9f29-763a-5697-9b25-6e9225e2c7df', '5270852-31.2024.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c60d1546-f99f-58c4-b44f-959b9b6e3099', '5056617-72.2024.8.13.0079', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('922c15ca-1d73-5a44-a759-74b8ac767bb9', '5064758-54.2024.8.13.0702', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('752b2c52-8e38-5ace-b1b4-72685fa4a7f2', '5005569-75.2025.8.13.0035', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e6232d06-b663-5676-a609-7995f6cdfa6e', '5271097-42.2024.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c3a918a9-11db-5bbe-8a2d-1772bf6095f0', '5015950-73.2024.8.13.0134', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4458ef49-df68-5efe-94f0-9822220bc63f', '5064803-58.2024.8.13.0702', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1969dcae-a517-5597-bbf9-8e69932a8b31', '1093747-44.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4c3c1a55-9357-5f92-a8dc-22b61b855707', '0007754-16.2025.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b901570f-1711-5e40-91a0-6857baf09035', '5040327-76.2024.8.21.0008', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0eee84ac-b481-576e-9444-0499a1fcc4ed', '5010718-07.2024.8.21.5001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7ee12443-48c0-5883-a873-1c01266e16ab', '5021279-36.2024.8.24.0045', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('743a4f6d-2480-5447-87a0-9653024b1b71', '5027491-16.2024.8.24.0064', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('49540b8c-8434-5a6a-8fd9-b08eb31f0ba2', '5275406-09.2024.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b6f38497-702c-544c-88fd-1c2483383798', '1175498-50.2024.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('862bdb34-b80c-5cfc-99d7-bafeb07450ca', '1018970-32.2024.8.26.0344', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cd84d63d-3754-50c4-a910-c757c50e9aac', '1179013-93.2024.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('98af9e80-a829-5d14-9f03-2f7a49b23f59', '1015075-51.2024.8.26.0348', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('22c9f815-dfe5-587a-9514-f2531eea3362', '5030199-73.2024.8.21.0015', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6eb42694-806a-554f-a032-3fe11472237c', '1018822-50.2024.8.26.0011', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8680a4e4-9e1c-5c0b-9222-8c5a396f72d5', '6047177-33.2024.8.09.0051', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7f139db8-6348-56a9-a893-92e209149a4b', '0843087-83.2024.8.19.0209', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('14f6515c-fba7-5e67-8006-a3ff44036e1f', '0814316-56.2024.8.19.0028', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ef3b30bb-2ba5-5ab4-8281-9a53c526c222', '0843765-19.2024.8.19.0203', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('01de15c0-a587-5b9b-9699-d92b7703c455', '8180123-96.2024.8.05.0001', 'TJBA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('325eab7f-3c91-5fe6-bd45-7aa12c24266e', '0001013-83.2024.8.25.0046', 'TJSE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1b080448-80a1-53cf-a417-7782340be810', '1053482-24.2024.8.26.0576', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a4c5e898-399d-57a2-96e1-0454c16d238c', '1015275-83.2024.8.26.0566', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0f021e14-c5ca-5318-8779-ee4d0f5c20e5', '1030244-40.2024.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('743cddaf-8c8a-5224-894e-1f0acd5f3fbc', '1031959-95.2024.8.26.0562', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('28397226-c36b-5ede-a5d6-a4c00437baab', '1062403-58.2024.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('360bf80a-58b6-59d2-a8ea-f0069fd7030d', '1023240-88.2024.8.26.0477', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f544111c-ecb9-5d1a-9421-fecd1159f345', '1031106-11.2024.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a3f1be2e-0997-58b5-9299-e246e084ab97', '1049604-13.2024.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('aec7cc05-ec08-553f-8d7a-560af36ee318', '1198216-41.2024.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8b13da03-4086-5e37-be6f-0a35157d264a', '1013151-13.2024.8.26.0604', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9b833ccc-43ab-54bd-8e2a-ca2ac2841594', '1050506-63.2024.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('407b271b-be6d-53d4-ab8c-9b5f293fc167', '1036899-34.2024.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('26ca46c0-7e2d-5918-a30c-253668f8db95', '1024421-27.2024.8.26.0477', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8efbefc2-de07-5f31-9343-f3527423f320', '1018076-07.2024.8.26.0037', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e30d762b-7ebb-5119-b762-49cb8a96c63c', '0756513-35.2024.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2cd82d5f-6827-511d-9da3-c909a1e88481', '1000492-80.2025.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dfe14924-a9c0-5549-87dc-efdce83fbcf3', '0076569-97.2021.4.03.6301', 'TRF-3')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ff99798e-817f-5463-b8de-bf2ef6dac865', '1001384-04.2025.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('450fb67b-a66d-50d3-b1b6-0dff204bf20b', '1000069-27.2025.8.26.0038', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ce9be80b-608b-5dd2-8edc-94e6887b1f3a', '1000291-91.2025.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('86dbf36f-66cb-597d-906e-7cd1c823c90b', '1002887-57.2025.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('70bad91a-f11f-5fc1-946f-0dcf9c7a29c9', '0800144-91.2025.8.19.0055', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f926989e-2617-5a51-9fc0-e0db8cfb6e8e', '0800788-10.2025.8.20.5001', 'TJRN')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1ac13a79-bdf3-5d6a-b4a9-c4b1372ece80', '5000030-14.2025.8.21.0098', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8891a4b0-ccd4-59db-8c91-19bbe9f6979a', '3002594-17.2025.8.06.0001', 'TJCE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cdfa5a2d-619d-59b5-91ea-735e608a75bf', '5000497-49.2025.8.13.0701', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('70b71a21-d797-5777-9b14-88d83e107f09', '0000757-24.2025.8.16.0025', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5e566200-d3c0-5c95-85fa-fa71dc3bf553', '1001069-46.2025.8.26.0011', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a4fbc979-b0ac-52c9-9868-a981b8801d03', '5000387-54.2025.8.13.0344', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('64aae5f9-4e15-54a6-a10a-1b0038c01dcf', '0001544-13.2025.8.17.2810', 'TJPE')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('743b749f-d401-581b-b55c-c0eb041aa21a', '5001352-68.2025.8.24.0039', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0b242936-1fd6-5ff9-9515-5f0186c9736c', '5000284-81.2025.8.24.0072', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dca96eb7-6b93-53b5-8595-f0b294ec87f6', '5025285-71.2025.8.21.0001', 'TJRS')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('46f45f12-8400-5dc0-9f66-51f818322d3b', '1005761-15.2025.8.11.0041', 'TJMT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ac554536-a29a-52d3-9883-8556f1626971', '1003513-76.2025.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d61c00f8-fce8-5d70-8c81-dd89f9fc97e9', '1017517-21.2025.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ebb38a83-de54-5670-a1a8-108297c2322e', '1009481-53.2025.8.26.0564', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b0d2f02d-dc9e-5dcd-8228-84639daf2ef3', '1017398-18.2025.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8ceff187-fdeb-5017-bdee-67377a5962bd', '1018427-64.2025.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2212d82d-2e90-5e99-90b2-d4b56795d9a6', '1018288-26.2025.8.26.0576', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f2bed3b4-388a-50f7-9886-c62ca7968ee9', '1019365-98.2025.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b46afc37-4e2a-54a4-afa4-17e2fc999b87', '1013788-42.2025.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5ec1dea3-9df5-53c0-9742-1bcf9155c6bd', '1065350-35.2025.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fb51ae24-e3f3-5498-a4b4-58f537c7e7fb', '1001175-76.2025.8.26.0150', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6a458247-557c-5f8f-9dfe-19425757ba2e', '1019374-11.2025.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('67aca79b-dc27-571d-99d2-1c94059c1433', '1005342-93.2025.8.26.0229', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('405c3644-22d3-5b80-8ee3-a53793477103', '1014853-17.2025.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('840fa43f-bf83-59c8-8832-e2b9d306ec18', '0020950-03.2022.8.03.0001', 'TJAP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('636379e5-0019-5569-a550-75b78169a2a1', '0018600-92.2022.8.19.0002', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4d0f3a71-6652-5498-a2ca-0e9950e13c50', '5215409-66.2022.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d5388235-4082-5829-a7a6-f4824bb4922e', '5025670-11.2022.8.13.0433', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0c6cbd51-f8ca-5d31-9300-b24b00b70192', '0266798-82.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1eabe0a9-d745-5417-8710-f7ac0e0d6146', '1038827-37.2022.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4a34a58f-fff8-5048-8907-5fd90499a31e', '0873393-59.2022.8.14.0301', 'TJPA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1a69c42b-ff79-58dd-853b-4be14d49847a', '1018186-78.2022.8.26.0068', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('92aacdc7-ca34-5df2-ab81-6d979a05d6ba', '0006806-38.2022.8.19.0208', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e2849d57-1c0e-528a-a130-b7216a8efc61', '0267680-44.2022.8.19.0001', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5a2aa208-c6de-55e5-8245-ce1e80d639a0', '0873473-23.2022.8.14.0301', 'TJPA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('00b9749b-fe6c-59da-ba99-0cb14eb26b79', '1008875-33.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e028bcb7-7efe-5d6b-9b07-108664147dd6', '1000402-26.2023.8.26.0045', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1ca561b8-11ff-55ec-a45f-3e6d66437efb', '1008885-77.2023.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fbbf7001-eead-5ede-83a1-348958d0237a', '1003490-89.2023.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('136801d7-cc73-5c82-ad79-03be6201ef43', '5000367-85.2023.8.13.0327', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d5b4546b-fa91-5541-b272-d24f4eebd017', '5000761-71.2023.8.13.0431', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1a1848a4-23b3-5489-a780-948db4899661', '5001348-46.2023.8.13.0382', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bb1661d0-7f3f-5b21-b11f-85be9192fe3e', '5001212-10.2023.8.13.0686', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('720ac07a-3a59-5850-9ee2-8180a072b9e0', '5005110-05.2023.8.13.0145', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8c1f8e8c-154b-534d-9908-069269ee0be1', '5005102-96.2023.8.13.0672', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('38a07f02-a55a-5a0f-be90-26f62b38ea33', '5001941-72.2023.8.13.0480', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8a0258b6-5277-5b49-81ef-8e0dd6c3eaac', '0702468-91.2023.8.07.0009', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5935f03c-1c6a-583b-ab4b-394158d49013', '0806873-80.2023.8.20.5001', 'TJRN')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('26b51e3a-ebbf-52c9-aa5f-88c0afc19aa0', '0805969-75.2023.8.14.0006', 'TJPA')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e4be58a9-2c18-5609-8544-8cc7ae33e152', '5000308-91.2023.8.13.0620', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a5d28550-67a0-5b48-a9df-2969b0158579', '5009329-84.2023.8.13.0105', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d2e5913c-80d6-555c-853a-196f002036c1', '0800290-59.2023.8.19.0005', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('48c841d3-fd50-5d15-a342-2f525864321f', '1007291-41.2023.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('337e1467-dcb1-511b-a2c8-35e56197c6da', '0801464-61.2023.8.19.0213', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5f3aec71-e37a-5b0c-a492-ddccb06b1e6d', '1013500-26.2023.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f49315e4-62d9-5b31-8041-e41a6ada4657', '0801394-24.2023.8.19.0058', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('367e74cf-6165-5f6c-99e0-96525efcdc4c', '0002367-71.2023.8.16.0033', 'TJPR')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('57ffc455-b863-5ef5-bb3d-66b20934cd6b', '0455052-22.2023.8.04.0001', 'TJAM')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fdef5ad0-6cf6-55f4-933c-2d30edea9ad3', '1005734-97.2023.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8a1c54fb-cf4d-5db3-a5e0-19db85725303', '1003032-18.2023.8.26.0704', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('057b9a27-8251-5fc6-ad59-b6238390de20', '1073699-27.2025.8.11.0041', 'TJMT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('09ce3aed-015f-564d-8fc2-e585e1286092', '1015006-64.2023.8.26.0506', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ce604f18-b2ca-5568-842a-7b458fe5e7e4', '0816682-26.2023.8.19.0021', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7a3f615a-210d-5a2d-a115-5b04d93af4df', '5009498-81.2023.8.13.0231', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b868d1cf-8547-5466-9892-ef01d011b440', '5001183-17.2023.8.13.0570', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('30e66a80-9c3b-5053-b090-e3e9e59e22bf', '5006957-91.2023.8.08.0012', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('40a9f6bb-14a3-5343-bbbf-25585e495cb6', '0720750-07.2023.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('298ed992-165e-5b7c-8e27-68b8b8fdb42e', '1004839-76.2023.8.26.0606', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('80ec0f29-940d-5a3a-9206-e5cb8246cbe8', '1021365-30.2023.8.26.0506', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('46303104-9ae5-538d-86d1-905344febb8d', '0804954-64.2023.8.19.0028', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1b656623-31dd-56b8-81a8-8a8ee0ed0e60', '0808636-87.2023.8.19.0008', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('88b3a444-e3ac-5503-b08a-c0d8a1e43e8f', '0503019-63.2023.8.04.0001', 'TJAM')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('358951be-675a-530d-a9bd-faef890a2b64', '5116211-22.2023.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('52a4e0d9-bc7e-5d0c-849b-ded35fbb6f62', '5116280-54.2023.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a33170bf-1745-5c1e-99b8-9bd2cca86bb3', '1019711-62.2023.8.11.0041', 'TJMT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5cc39446-7b9d-5e62-a837-f52c4f860027', '0513242-75.2023.8.04.0001', 'TJAM')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0a9024e4-8d5b-5206-8954-ff26131fc07e', '1007974-81.2023.8.26.0223', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3125d83e-4287-5e31-a643-7205a6576463', '1003070-34.2023.8.26.0541', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ce04a72e-42f4-5da3-a377-53f0cada4004', '0802693-45.2023.8.19.0055', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6e672124-71b7-59a6-b0f0-f82372ae0409', '0805550-63.2023.8.19.0023', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('40cf4693-36da-5da4-ab19-7932887c7e46', '0818737-77.2023.8.19.0205', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('533f88f2-e959-54ef-8807-00869f3d49fc', '5014475-70.2023.8.24.0018', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fa262683-84ee-57ba-8601-63ac599b9238', '5022687-93.2023.8.13.0145', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('26ffccab-a14a-5b6d-b099-240e394d746c', '5005226-14.2023.8.13.0338', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c8a4d3df-4ab6-5d8c-8d22-5a85f92c8efd', '5004895-44.2023.8.13.0625', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8ea68607-b0a2-58e7-9170-cded827b1f57', '5003768-51.2023.8.13.0470', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e2c57e43-1f0b-55de-9060-59164112818a', '5004151-37.2023.8.13.0241', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('95c04ac7-d19c-5f8b-9fba-2abec6da50e5', '5128133-60.2023.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('6eb0ef95-de40-5d1e-b3c4-6fb65e62d83d', '5128166-50.2023.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('60815ca7-d9c1-5c46-b9a2-6db00211d9c2', '5128174-27.2023.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('90524cb8-576d-5f38-b96a-9b256158beae', '5001151-63.2023.8.24.0163', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('52a48a66-6c6a-579c-9d47-3882646379b8', '5043576-40.2023.8.24.0023', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ad46510f-3f9d-5643-b654-18981a64ba5f', '0832097-20.2023.8.20.5001', 'TJRN')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a9031a4a-6538-53da-b910-2ae76c6f2994', '0815071-59.2023.8.19.0208', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('55645129-cdba-5758-87fa-5b0a27968509', '1005666-04.2023.8.26.0278', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a473056e-daa5-5bb6-9d70-fb83994b870e', '5129314-96.2023.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('74079c18-e851-5e86-ac7c-a5099df9880f', '5007712-76.2025.8.13.0313', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a4ca847d-4520-5d9f-8dc3-9b28d7cf97a3', '5001699-11.2023.8.13.0611', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('77cf8191-f91f-5f8d-a194-b6aa5c45f376', '1025950-28.2023.8.26.0506', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5177e51f-456f-598c-b7af-a680acad974f', '1014310-76.2023.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('04bce48b-272b-5452-a838-e1fd63efa74a', '1015157-84.2023.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('752a106c-b50a-55af-8a31-545db1af6916', '0004638-33.2024.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f7c0860b-71b3-565f-8ba3-1d2b5bfc7013', '5003648-94.2024.8.24.0040', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('236efd70-45d1-5d95-b909-169da15d6565', '5019060-34.2024.8.24.0018', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cc50cba9-e612-5d3d-ad4f-8380f802fd74', '1028942-37.2024.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9db1a675-1be4-5805-b76b-5940183be30f', '1003519-38.2024.8.26.0191', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f827fa67-ded7-5c2d-b904-16624d481742', '5194694-32.2024.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('39174108-908b-59b1-afbb-e35846c62738', '5023456-76.2024.8.13.0433', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2a7f6547-1c8e-5f69-9490-554b7abeb544', '1016273-63.2025.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d1059158-ee84-5311-af9b-b17fafc0952d', '1004952-56.2025.8.26.0510', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('71deae7c-b9a7-5bb6-a228-e3f5d161e612', '1038748-10.2025.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('28a4f556-3e8e-537d-ada0-5ce35c27298f', '1038754-17.2025.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c4613bc3-70d7-5a76-b4af-428d81e5756e', '1067220-18.2025.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7fa8b78f-7e7b-5dce-9bbc-1c7d25378386', '1067810-92.2025.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8a720784-37e1-53f6-9f6e-bd9e1834ce2e', '1023505-39.2025.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dba32adc-59b2-5372-88f7-7039afa96d89', '1067874-05.2025.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('37cd47cc-cd11-51d8-b73a-915ba164efd8', '1067884-49.2025.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9b493283-8d2a-5bb9-846a-b6bdfad16286', '1012142-29.2025.8.26.0071', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('275759fb-bcf9-570c-ac06-dbc4bdab9110', '1001716-41.2025.8.26.0108', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('554113c1-89f1-56cb-bf3c-b5d2b99d0a7f', '1008572-42.2025.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c8bf3077-d96a-5ba9-a9a3-60572b56f499', '1022362-54.2025.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4bf49bef-6c9b-51cd-9e1f-1adbf7e1930d', '1016717-96.2025.8.26.0001', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c0411511-5173-5f49-bbdb-87df162d6d2b', '1039785-72.2025.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7ce1f7c5-79b9-5936-aed4-d855e136b097', '1022548-77.2025.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c20a72e9-d8ce-5f36-b313-e4cb4341ecde', '1002212-75.2025.8.26.0462', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d5e164ef-46aa-5358-97ce-25e3ea58183b', '1003896-28.2025.8.26.0529', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4d09117d-3cae-5edb-8d01-772114302c90', '1070011-57.2025.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8e81d7ce-b9d0-5b03-9087-6c89e9bb2598', '1069255-48.2025.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('66c4018c-c18a-586f-ad03-da4c58780bda', '1001862-06.2025.8.26.0101', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bb1c6423-0a1d-5db7-b383-02418d753898', '1012745-05.2025.8.26.0071', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('e5285669-0472-5948-bc41-03cdfb550d39', '1013521-15.2025.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('3b7db0a8-00a5-50e5-9787-5a412843a066', '1014689-10.2025.8.26.0405', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('be10a073-8a22-5950-b10a-ec423ff75cab', '1024219-96.2025.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bb04dedf-32dd-5c40-8978-ec1c87c23111', '5007409-44.2025.8.13.0707', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('160d1d33-a0c2-5807-8e51-5540fb5daf03', '0827721-10.2025.8.18.0140', 'TJPI')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('38ac1c0a-625f-5190-9e1d-1c74762d06e4', '1012529-50.2025.8.26.0554', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bcff0177-ee8c-5b05-9028-29bd7157fba7', '1002464-81.2025.8.26.0073', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('04cffb2b-7af6-529d-833b-cd8dec70f8d5', '1013512-53.2025.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('98a4c257-3ebc-580a-9191-bcd0bea1b959', '1006652-55.2025.8.26.0223', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('79b2065b-edfa-596b-970f-e62982234735', '1008558-37.2025.8.26.0011', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bf2c789e-13f0-5594-aa8a-835f3b9520ab', '1041005-08.2025.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2525b803-ea26-5dbb-b539-3c4ae59e73b6', '1071123-61.2025.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a20d160e-188e-5cd6-ae6f-f0dc9bfbaf0b', '1015438-69.2025.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1a6b010e-750e-5351-aa62-9c91ac6d6df3', '5002965-73.2025.8.08.0038', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cef5de04-13a8-5906-9809-4bf5ea83d4a8', '0811397-18.2025.8.19.0042', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ce9ae2a2-a0a7-5548-a62e-5b4ae783e164', '1083439-09.2025.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f0f80e91-5568-5c18-9a39-8f2bd69a4ef6', '1010062-02.2025.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('13a59205-e592-5095-9a58-d432dc8915f1', '1005401-14.2025.8.26.0704', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5245bdf4-e07c-5e13-8578-3451797ec6fd', '1010286-33.2025.8.26.0361', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bc32fd81-d93e-5758-bec4-f5a4420ed562', '1110511-08.2024.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ab846aaf-69d2-51c6-9a9d-8cbf8355cc08', '1003906-85.2025.8.26.0266', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f402c3aa-2662-5bc0-8dfc-3cb7d7146554', '1088083-92.2025.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('30ac943d-4476-5ad2-92ae-545341604d4e', '1027861-19.2025.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8c12c8ae-d3cd-52ba-bff3-a059f6b73a67', '1008281-64.2025.8.26.0320', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a11d51eb-f6d3-55b1-bcbd-3bfcbae60277', '1016198-18.2025.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1bddba38-e9a7-5df3-aebe-bcdcdfef0426', '1007835-53.2025.8.26.0161', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4314da02-9988-5179-9a76-d8616f206fb4', '1005769-77.2021.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('4df36871-eb71-5db5-bc6e-822724d5f409', '0002802-56.2023.8.26.0004', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5981ef7e-56a2-5eaf-aa38-feafbddf0200', '1014512-46.2025.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0eb36519-130f-5820-b6c1-e2fd379ca19c', '1019326-80.2024.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5faef59d-ee6f-5e2a-ab97-abe25f3f3a66', '1015796-68.2020.8.26.0016', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('bd9151ec-48b3-587a-ab15-baa4a0609def', '1020225-78.2024.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('7da4d8f2-66fc-53cc-9c1a-83bb4028faa1', '1003009-95.2023.8.26.0664', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ee01416f-75fe-55d9-8a6e-4cb99e486ad5', '5005639-32.2023.4.03.6322', 'TRF-3')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a359cef2-5a09-5725-91c3-5c08ba3bdb40', '1005422-96.2023.8.26.0271', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c0654357-b99f-5d7b-b12a-9575d01a90c8', '5015684-76.2025.8.13.0223', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c2c18bd6-779c-5a59-81ce-ea57440f9019', '1002087-86.2025.8.26.0372', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b243dfe6-f707-5f96-a4e1-c6cbb1b1d522', '1013514-75.2025.8.26.0309', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('8db91fea-d861-5e93-bc42-aee9ed0ead5d', '1004607-51.2025.8.26.0038', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('974fcf09-3a7a-5e80-8ae5-cf6b72ecda2b', '1026435-60.2025.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('230640d8-f0d3-5e02-8b11-a6fa1dc0c59c', '1031622-58.2025.8.26.0114', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b23b654c-202a-507c-84c1-a120b9a23209', '1007427-75.2025.8.26.0286', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('940ec723-94b9-50cb-90bd-1f8b357b8ae2', '1034815-42.2025.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b336bfe9-ff69-5125-83bb-611ccd608479', '1026577-64.2025.8.26.0602', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('d7edad43-d650-52f8-b8ea-9c450f4fa3d6', '1019423-46.2025.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('39890517-a671-51ad-9e1d-494232d59fff', '4004468-56.2025.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('37f33d3a-0400-5609-9193-7e0a6c8c1c16', '1103054-82.2025.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('0121227c-90b4-52ec-88ac-0bd34984fb22', '1015693-45.2025.8.26.0482', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9e05f0c4-cfa5-5c2e-a468-bb90c84754f5', '1011532-20.2025.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c26d0da3-37be-5949-80c4-e9683fa17881', '1103084-20.2025.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ef85f9e5-6606-5b45-85b7-490790eccad3', '1006442-44.2025.8.26.0048', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('11691368-ab02-559b-8a81-f4fc61140bc2', '0827212-39.2025.8.19.0209', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ffd936fb-1ee0-50e0-ae9c-4d573f623067', '1009309-30.2025.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('94af1c3c-24bc-52b6-88a2-b7a9cb67d728', '1019062-29.2025.8.26.0003', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('48ae98da-b8f0-5387-b02b-dd35d37a8650', '1035669-36.2025.8.26.0224', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('fb09dd72-7067-54ba-8ecc-271575aa9f9b', '1002196-84.2025.8.26.0539', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c34bfded-5934-57f2-b758-b624a8439e6d', '1013905-30.2025.8.26.0309', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c3c9100f-e81d-5c6a-92c6-5496335c286f', '1009888-84.2025.8.26.0006', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('29b13af5-a4d9-5eb0-b264-2b967fa779af', '1009131-13.2025.8.26.0161', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f2bf9efb-5565-5f61-9591-8359d153522b', '1011863-02.2025.8.26.0020', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9c4d8c17-7152-53cb-958b-1ce648df183b', '4004540-43.2025.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('69a11a8a-c0b0-5931-88eb-2ad42a16a8bb', '1103117-10.2025.8.26.0100', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9471dc55-ff5d-51b6-8417-e24ce633740c', '0842721-38.2025.8.19.0038', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('944f77ec-6c0f-5672-a361-94830a4c7884', '1009317-07.2025.8.26.0009', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('f5082245-664e-5c5e-980a-be582a35bba2', '5023671-93.2025.8.24.0018', 'TJSC')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2953890c-6bf0-5a99-9ca4-1e1072bbdc33', '0740007-47.2025.8.07.0001', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('2bd5ce0f-b2d9-5e1c-93f1-d011c9c40211', '5028009-64.2025.8.08.0048', 'TJES')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c72de90e-cf97-5b80-ae42-5403e4283974', '4002599-52.2025.8.26.0005', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('a4a11fa2-d368-5946-87b3-c7cd6b20b911', '5009585-16.2025.8.13.0183', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('cd7fd9ea-0d2f-5fe9-9b69-6ccdb28859fc', '1023936-81.2025.8.26.0577', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('839d0adf-57d4-55df-8c18-5dc0ac0ecfed', '5641873-36.2025.8.09.0164', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1e7013d4-7c8d-55b4-97c5-908633c21c13', '1000524-11.2025.8.26.0355', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5085b03c-2ecf-541f-b49d-913f0bb5c63f', '5649169-60.2025.8.09.0051', 'TJGO')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('c5159d60-11b8-58cc-8d24-27c4104dac4c', '1041589-69.2025.8.13.0024', 'TJMG')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('dc3ebe88-79ea-5fd0-b25d-1934321c0e53', '1005699-63.2025.8.26.0297', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b2ac2612-beba-5c26-a04f-ab4330da2d95', '1004299-58.2025.8.26.0541', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('9c7595b9-2fcb-53aa-9660-47150c7dd93e', '1008525-14.2025.8.26.0604', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('1b3ecfd0-ee0e-57ee-9a52-c5ee1f41ccd2', '0806922-10.2025.8.19.0045', 'TJRJ')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('07689ce7-09ee-5044-abd8-5262c4318e2b', '4006495-97.2025.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('b635946a-beba-5d3f-8735-9606624166e1', '4001016-10.2025.8.26.0271', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('5bc74dde-c9db-5a64-ae61-3e6131401e87', '4006500-22.2025.8.26.0007', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('ee660843-d437-5f22-a259-75fbeaad2b61', '4011655-21.2025.8.26.0002', 'TJSP')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
INSERT INTO processes (id, cnj, court)
VALUES ('069d703a-2a78-5ab9-890f-d364109b05e9', '0708694-29.2025.8.07.0014', 'TJDFT')
ON CONFLICT (cnj) DO UPDATE SET
  court = COALESCE(processes.court, EXCLUDED.court);
COMMIT;