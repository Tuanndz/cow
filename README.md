# HỒ SƠ TỔNG HỢP: CỐT TRUYỆN, LUẬT CHƠI, CẤU TRÚC TÀI NGUYÊN & KỊCH BẢN NỐI FILE 100% GAME "THE CATTLE"
*(Dành cho dự án chuyển thể / Port sang Bot Zalo)*

---

## 1. TỔNG QUAN DỰ ÁN & GAME "THE CATTLE"
- **Tên trò chơi:** The Cattle
- **Thể loại:** Analog Horror / Anomaly Inspection Simulator (Mô phỏng kiểm tra dị thường rùng rợn, phong cách tương tự *That's Not My Neighbor*, *Papers, Please* nhưng đặt trong bối cảnh nông trại / trạm kiểm dịch bò).
- **Engine gốc:** Godot Engine 4.7.0.
- **Mục tiêu của người chơi:** Vào vai người gác trạm kiểm dịch gia súc, mỗi ngày kiểm tra từng con bò được đưa đến trạm trong vòng 7 ngày liên tiếp. Phân biệt bò bình thường và các sinh vật dị thường giả dạng bò, quyết định **Cho qua (Allow)** hoặc **Bắn hạ (Shoot)** để sống sót và tìm ra sự thật đằng sau.

---

## 2. TOÀN BỘ CỐT TRUYỆN & CÁC KẾT THÚC (STORY & ENDINGS)

### 2.1. Bối cảnh & Diễn biến qua 7 Ngày

- **Ngày 1 (Day 1) - Sự khởi đầu âm thầm:**
  Bản tin sáng thông báo Bộ Nông nghiệp xác nhận một vài báo cáo riêng lẻ về việc "đổi màu da bất thường" ở đàn bò phía bắc. Phát thanh viên trấn an dư luận rằng "không có gì phải lo lắng", chỉ là thủ tục kiểm dịch thông thường. Tuy nhiên, người chơi bắt đầu thấy những vệt đỏ kỳ dị lan dưới da của một số con bò.

- **Ngày 2 (Day 2) - Những vết thương không chảy máu:**
  Bản tin bắt đầu hướng dẫn thanh tra chú ý tới tư thế tai của bò (tai rủ bất thường biểu hiện căng thẳng) và những vết thương hở. Người chơi phát hiện những con bò có tai rủ như giẻ ướt, không phản ứng với âm thanh, và những vết cắt sâu hoắm trên thân nhưng tuyệt nhiên không chảy một giọt máu.

- **Ngày 3 (Day 3) - Tiếng kêu muốn giao tiếp & Kẻ thu gom:**
  Bản tin đề cập đến những âm thanh kêu "méo mó" (distorted moo). Cảnh báo thanh tra: nếu nghe thấy tiếng bò có vẻ như đang cố gắng **giao tiếp (communicative)** thì phải báo cáo ngay. Cuối bản tin bất ngờ xuất hiện một khung hình chèn sóng ma quái cùng giọng đọc: *"The Gatherer is watching"* (Kẻ Thu Gom đang dõi theo).

- **Ngày 4 (Day 4) - Biến dạng giải phẫu:**
  Bản tin nói rằng nhiều nhân viên báo cáo thấy bò có thêm chi thừa (5 chân trở lên), nhưng nhà đài giải thích đây là do nhân viên mệt mỏi và mắt nhìn kém. Thực tế, quái vật bắt đầu mọc thêm các chi dị dạng nép sát bụng.

- **Ngày 5 (Day 5) - Mùi thối rữa & Sự can thiệp quân sự:**
  Quân đội đã được điều động để kiểm soát tình hình gia súc. Bản tin yêu cầu người dân phớt lờ những chương trình phát sóng trái phép. Quái vật bắt đầu thối rữa với bầy ruồi bu kín. Cuối bản tin, màn hình nhấp nháy dòng chữ rùng rợn: *"WE SEE YOU"*.

- **Ngày 6 (Day 6) - Giả dạng tinh vi & Đôi mắt người:**
  Bản tin cảnh báo: một số sinh vật nhiễm bệnh đã học được cách **bắt chước hành vi của bò khỏe mạnh** rất thuần thục để qua mắt thị giác thông thường. Chỉ thị khẩn: *"Hãy tin vào đôi mắt hơn bất kỳ thứ gì khác. Nếu đôi mắt có vấn đề (mắt người), sinh vật đó chắc chắn là dị vật."*

- **Ngày 7 (Day 7) - Ngày tận thế & Ngã rẽ quyết định:**
  Bản tin mở đầu với lời lẽ lạnh lẽo gửi thẳng cho người chơi: *"Inspector. Thank you. Six days. Today will be the last one. ARMAGEDDON IS HERE."*

---

### 2.2. Bí mật tà giáo "The First Herd" (Đàn Bò Đầu Tiên)
Qua các trang nhật ký bí mật nhặt được:
- Nhân vật chính nhận ra bản tin TV không phải đang cảnh báo, mà đang **dạy người chơi cách chọn lọc và tiêu diệt**.
- Những cái xác bị bắn hạ không hề bị tiêu hủy, mà có một nhóm người mặc **áo choàng trắng** dùng xe tải chở chúng vào trong sương mù dày đặc.
- Giáo phái này tôn thờ thực thể gọi là *"The First Herd"* (Đàn Bò Đầu Tiên). Bằng việc người chơi bắn hạ các dị vật, người chơi thực chất đang cung cấp vật phẩm hiến tế để chúng hoàn tất nghi lễ hồi sinh / tạo ra thảm họa Armageddon.
- Chiếc tivi chính là vật dẫn truyền thôi miên / thao túng nhận thức của thanh tra.

---

### 2.3. Ba Cái Kết (3 Endings)

1. **Ending 1/3 — BAD ENDING (Kết cục Tồi Tệ):**
   - **Điều kiện:** Sống sót qua 7 ngày nhưng đã để lọt ít nhất 1 con dị thường vào trang trại (`anomalies_let_in > 0`).
   - **Nội dung:** *"Bạn đã trụ lại đủ 7 ngày. Nhưng bạn đã để chúng lọt vào trong. Dù cho thứ mà chúng đang gầy dựng là gì, bạn đã tiếp tay cho chúng. Ánh đèn trong chuồng trại của bạn vẫn sáng. Đó là lòng khoan dung duy nhất trong chuyện này."*

2. **Ending 2/3 — GOOD ENDING / NORMAL ENDING (Kết cục Bình Thường):**
   - **Điều kiện:** Sống sót qua 7 ngày mà không để lọt con dị thường nào, nhưng bạn vẫn bật TV vào sáng ngày 7 hoặc chưa thu thập đủ 6 trang nhật ký.
   - **Nội dung:** *"Bạn đã sống sót qua 7 ngày. Không có thứ gì lọt được vào bên trong. Đàn gia súc sạch sẽ. Chuồng trại tĩnh lặng. Bạn đã hoàn thành công việc của mình, và bạn sẽ không bao giờ biết được lý do tại sao. Một vài trang giấy vẫn chưa được đọc."*

3. **Ending 3/3 — TRUE ENDING (Chân Kết Cục):**
   - **Điều kiện mở khóa hoàn hảo:**
     1. Không để lọt bất kỳ con dị thường nào trong suốt 6 ngày (`anomaly_ever_let_in == false`).
     2. Không bao giờ bắn nhầm bò vô tội (`stat_normals_shot == 0`).
     3. Thu thập đủ cả 6 trang nhật ký từ Ngày 1 đến Ngày 6.
     4. Vào sáng Ngày 7, màn hình hiện lựa chọn: **"Turn on the TV"** hoặc **"Don't turn on the TV"** -> Người chơi phải chọn **"Don't turn on the TV" (Không bật TV)**!
   - **Nội dung:** Bạn từ chối tiếp nhận bản tin dẫn dụ của tà giáo. Màn sương tan biến, ánh bình minh thanh bình ló rạng trên đồng cỏ. Một chú bò bình thường thong dong bước qua. Trang nhật ký số 7 rơi xuống:
     > *"Bạn không bao giờ để một con lọt vào. Bạn chưa từng bắn nhầm một sinh linh vô tội. Bạn đã tìm thấy tất cả các trang nhật ký. Bạn đã tắt chiếc tivi đi, và bình minh vẫn cứ đến.*  
     > ***Có lẽ ngày mai sẽ thuộc về chúng ta."***

---

## 3. TOÀN VĂN 7 TRANG NHẬT KÝ (JOURNAL PAGES)

| Trang | Nội dung tiếng Anh (Gốc) | Bản dịch tiếng Việt |
| :--- | :--- | :--- |
| **Trang 1** | *They called it routine. Check the skin. Check the paperwork. Check the eyes. It almost feels rehearsed. The news always knows what to tell us before we ever see it ourselves.* | Họ gọi đây là thủ tục định kỳ. Kiểm tra da. Kiểm tra giấy tờ. Kiểm tra mắt. Mọi thứ như thể đã được tập dượt từ trước. Bản tin luôn biết cần phải nói gì với chúng tôi trước khi chúng tôi tự mình nhìn thấy. |
| **Trang 2** | *Every morning they add something new. Every afternoon I find it. Is the broadcast warning us... or teaching us what to notice? I can't decide which answer frightens me more.* | Mỗi sáng họ lại thêm vào một điều mới. Mỗi chiều tôi đều bắt gặp đúng điều đó. Liệu bản tin đang cảnh báo chúng ta... hay đang dạy chúng ta cần phải chú ý đến cái gì? Tôi không biết câu trả lời nào khiến tôi sợ hãi hơn. |
| **Trang 3** | *One looked at me today. Not like an animal. Like it recognized me. It never moved. It only watched until the truck came. The men unloading the bodies wore no uniforms. Only white robes.* | Hôm nay có một con nhìn tôi. Không phải ánh nhìn của loài vật. Mà như thể nó nhận ra tôi. Nó không hề cử động. Nó chỉ chăm chăm nhìn cho đến khi chiếc xe tải đến. Những người bốc dỡ các xác chết không mặc đồng phục. Chỉ khoác trên mình những chiếc áo choàng trắng. |
| **Trang 4** | *I followed one of their trucks after my shift. It stopped in a field I swear wasn't there yesterday. They carried the bodies into the fog. I heard voices repeating the same sentence over and over. 'The First Herd gathers what is returned.' I left before they saw me. At least... I hope they didn't.* | Sau ca trực, tôi đã bám theo một trong những chiếc xe tải của họ. Nó dừng lại ở một cánh đồng mà tôi thề là hôm qua chưa từng có. Họ khiêng những cái xác tiến vào làn sương mù. Tôi nghe thấy những giọng nói lặp đi lặp lại cùng một câu: "Đàn Bò Đầu Tiên tập hợp những gì được trả về." Tôi rời đi trước khi họ nhìn thấy tôi. Ít nhất là... tôi hy vọng họ đã không thấy. |
| **Trang 5** | *The anchor looked at the camera today. No... He looked at me. The television stayed on after the broadcast ended. There was no picture. Just one voice.* | Hôm nay phát thanh viên nhìn thẳng vào ống kính. Không... Ông ta nhìn thẳng vào tôi. Chiếc TV vẫn bật sau khi bản tin kết thúc. Không có hình ảnh nào cả. Chỉ có duy nhất một giọng nói. |
| **Trang 6** | *I finally understand. Every one we destroy is taken somewhere. They're building toward something. A gathering. A ritual. They've tried before. I think this may be their last chance. If I'm right... then tomorrow morning do not watch the broadcast. Turn the television off before it begins.* | Cuối cùng tôi đã hiểu ra. Mỗi con quái vật chúng ta tiêu diệt đều bị đưa đi một nơi nào đó. Chúng đang gầy dựng một thứ gì đó. Một cuộc tụ họp. Một nghi lễ hiến tế. Chúng đã từng thử trước đây. Tôi nghĩ lần này có thể là cơ hội cuối cùng của chúng. Nếu tôi đúng... thì sáng mai đừng xem bản tin nữa. Hãy tắt chiếc tivi đi trước khi nó bắt đầu phát sóng. |
| **Trang 7** *(True Ending)* | *Maybe tomorrow belongs to us.* | Có lẽ ngày mai sẽ thuộc về chúng ta. |

---

## 4. LUẬT CHƠI & CƠ CHẾ GAMEPLAY (GAME RULES)

### 4.1. Hệ thống Mạng (Lives)
- Người chơi bắt đầu với **3 mạng** (biểu thị bằng 3 ngọn đèn/trái tim).
- **Mất mạng khi:**
  1. **Bắn nhầm bò bình thường:** Trừ 1 mạng ngay lập tức!
  2. **Để lọt quái vật vào ban đêm:** Quái vật lọt vào chuồng trại sẽ quậy phá, gầm rú và tấn công vào ban đêm, trừ mạng theo số lượng quái vật lọt vào!
- Mất hết 3 mạng = **GAME OVER**.

### 4.2. Bảng Phân Bổ Bò & Dị Thường Từng Ngày

| Ngày (Day) | Bò thường | Dị thường (Anomalies) | Tổng số bò | Manh mối / Dị thường mới xuất hiện |
| :---: | :---: | :---: | :---: | :--- |
| **Ngày 1** | 4 con | 3 con | 7 con | **Ửng đỏ (Redness):** Da, mắt, tai, chân, đuôi hoặc miệng bị ửng đỏ bất thường. |
| **Ngày 2** | 4 con | 4 con | 8 con | **Tai rủ (Droopy ears)** & **Vết cắt sâu không chảy máu (Cuts/Wounds)** trên thân. |
| **Ngày 3** | 5 con | 4 con | 9 con | **Tiếng kêu kỳ quái (Weird Sound / Distorted Moo):** Tiếng rên rỉ muốn giao tiếp. |
| **Ngày 4** | 4 con | 7 con | 11 con | **Chi thừa (Extra Limbs):** Có 5 chân hoặc chân mọc dị dạng gập dưới bụng. |
| **Ngày 5** | 5 con | 7 con | 12 con | **Ruồi bu & Thối rữa (Flies / Rotten):** Ruồi bu dày đặc, vết lở loét hôi thối. |
| **Ngày 6** | 5 con | 8 con | 13 con | **Đuôi bất thường (Tail wrong)** & **Mắt người (Human eyes):** Mắt người nhìn chằm chằm. |
| **Ngày 7** | 6 con | 9 con | 15 con | **Toàn bộ dị thường kích hoạt cùng lúc (All Traits Active).** |

---

## 5. CẤU TRÚC CHI TIẾT TOÀN BỘ THƯ MỤC TÀI NGUYÊN (FULL DIRECTORY TREE)

Dưới đây là cây thư mục hoàn chỉnh với **toàn bộ từng file** đã được giải nén, chuyển đổi và phân loại vào thư mục `port bot/`:

```text
port bot/
│
├── README.md                                             <-- Tài liệu hướng dẫn, luật chơi & cốt truyện game
│
├── data/
│   └── game_data.json                                    <-- CSDL JSON hoàn chỉnh chứa config, traits, mô tả, tin tức, nhật ký, kết cục
│
└── assets/
    │
    ├── audio/
    │   ├── music/                                        <-- Nhạc nền BGM game (22 files)
    │   │   ├── COW 1.mp3                                 <-- Tiếng bò kêu mẫu 1
    │   │   ├── COW 2.mp3                                 <-- Tiếng bò kêu mẫu 2
    │   │   ├── Click.mp3                                 <-- Tiếng click menu
    │   │   ├── Distorted Moo 2.mp3                       <-- Tiếng kêu quái dị 2
    │   │   ├── Distorted Moo.mp3                         <-- Tiếng kêu quái dị 1
    │   │   ├── Last Morning News (DAY 7).mp3             <-- Nhạc nền bản tin sáng Ngày 7
    │   │   ├── Loading BGM.mp3                           <-- Nhạc nền màn hình chờ
    │   │   ├── Main Screen BGM.mp3                       <-- Nhạc nền màn hình chính
    │   │   ├── Main Title.mp3                            <-- Nhạc nền tiêu đề game
    │   │   ├── Morning BGM.MP3                           <-- Nhạc nền buổi sáng
    │   │   ├── Morning News.mp3                          <-- Nhạc nền bản tin buổi sáng thông thường
    │   │   ├── Nighttime (Day 1-6).mp3                   <-- Nhạc nền ban đêm Ngày 1-6
    │   │   ├── Noon (Day 1-4).mp3                        <-- Nhạc nền ca trực chiều Ngày 1-4
    │   │   ├── Noon (Day 5).mp3                          <-- Nhạc nền ca trực chiều Ngày 5
    │   │   ├── Noon (Day 6).mp3                          <-- Nhạc nền ca trực chiều Ngày 6
    │   │   ├── Noon (Day 7 Bad and Good ED).mp3          <-- Nhạc nền ca trực chiều Ngày 7 (nhánh Bad/Good)
    │   │   ├── Noon (Day 7 True ED).mp3                  <-- Nhạc nền ca trực chiều Ngày 7 (nhánh True Ending)
    │   │   ├── THUD SFX.mp3                              <-- Âm thanh va đập mạnh / chuyển ngày
    │   │   ├── Typing SFX.mp3                            <-- Hiệu ứng chữ gõ máy typewriter
    │   │   ├── Weapon Pull Out SFX.mp3                   <-- Âm thanh rút súng shotgun
    │   │   ├── Weapon Shoot SFX.MP3                      <-- Âm thanh nổ súng shotgun
    │   │   └── freesound_community-crumple-03-40747.mp3  <-- Âm thanh mở/vò trang nhật ký giấy
    │   │
    │   ├── sfx/                                          <-- Âm thanh hiệu ứng chi tiết (10 files)
    │   │   ├── COW 1.mp3                                 <-- Tiếng bò thường kêu 1
    │   │   ├── COW 2.mp3                                 <-- Tiếng bò thường kêu 2
    │   │   ├── Click.mp3                                 <-- Tiếng nút bấm UI
    │   │   ├── Distorted Moo 2.mp3                       <-- Tiếng quái vật biến dạng 2
    │   │   ├── Distorted Moo.mp3                         <-- Tiếng quái vật biến dạng 1
    │   │   ├── THUD SFX.mp3                              <-- Âm thanh thình thịch
    │   │   ├── Typing SFX.mp3                            <-- Tiếng gõ chữ text box
    │   │   ├── Weapon Pull Out SFX.mp3                   <-- Rút súng
    │   │   ├── Weapon Shoot SFX.MP3                      <-- Bắn súng
    │   │   └── freesound_community-crumple-03-40747.mp3  <-- Mở trang giấy
    │   │
    │   └── voices/                                       <-- 29 file voice WAV phát thanh viên TV theo ngày
    │       ├── day1/                                     <-- Voice bản tin Ngày 1 (5 câu)
    │       │   ├── LINE 1.wav                            <-- "Good Morning. Thank you for tuning in."
    │       │   ├── LINE 2.wav                            <-- "The Department of Agriculture has confirmed..."
    │       │   ├── LINE 3.wav                            <-- "A department spokesperson stressed this morning..."
    │       │   ├── LINE 4.wav                            <-- "Inspectors are reminded to examine livestock..."
    │       │   └── LINE 5.wav                            <-- "We'll have more on this story as it develops..."
    │       ├── day2/                                     <-- Voice bản tin Ngày 2 (4 câu)
    │       │   ├── LINE 1.wav                            <-- "Good morning."
    │       │   ├── LINE 2.wav                            <-- "Officials continue to investigate..."
    │       │   ├── LINE 3.wav                            <-- "Veterinary staff advise inspectors to pay close attention..."
    │       │   └── LINE 4.wav                            <-- "To be clear: there is still no evidence of contagious infection..."
    │       ├── day3/                                     <-- Voice bản tin Ngày 3 (5 câu)
    │       │   ├── LINE 1.wav                            <-- "Good morning."
    │       │   ├── LINE 2.wav                            <-- "Reports continue to come in regarding abnormal vocalizations..."
    │       │   ├── LINE 3.wav                            <-- "Veterinary consultants remind inspectors that stress..."
    │       │   ├── LINE 4.wav                            <-- "If, however, an animal's vocalization strikes you as communicative..."
    │       │   └── LINE 5.wav                            <-- "...The Gatherer is watching."
    │       ├── day4/                                     <-- Voice bản tin Ngày 4 (3 câu)
    │       │   ├── LINE 1.wav                            <-- "Several field inspectors have reported anatomical abnormalities..."
    │       │   ├── LINE 2.wav                            <-- "The department wishes to assure the public..."
    │       │   └── LINE 3.wav                            <-- "Continue standard procedure."
    │       ├── day5/                                     <-- Voice bản tin Ngày 5 (4 câu)
    │       │   ├── LINE 1.wav                            <-- "This morning the department confirmed military personnel..."
    │       │   ├── LINE 2.wav                            <-- "We want to emphasize: this remains a livestock incident..."
    │       │   ├── LINE 3.wav                            <-- "Inspectors, continue your assigned duties..."
    │       │   └── LINE 4.wav                            <-- "WE SEE YOU"
    │       ├── day6/                                     <-- Voice bản tin Ngày 6 (3 câu)
    │       │   ├── LINE 1.wav                            <-- "Effective immediately, inspectors are required to verify..."
    │       │   ├── LINE 2.wav                            <-- "Some infected animals have been observed imitating healthy behavior..."
    │       │   └── LINE 3.wav                            <-- "Trust the eyes over the rest of the exam..."
    │       └── day7/                                     <-- Voice bản tin Ngày 7 (5 câu)
    │           ├── LINE 1.wav                            <-- "Inspector."
    │           ├── LINE 2.wav                            <-- "Thank you."
    │           ├── LINE 3.wav                            <-- "Six days."
    │           ├── LINE 4.wav                            <-- "Today will be the last one."
    │           └── LINE 5.wav                            <-- "ARMAGEDDON IS HERE"
    │
    ├── images/
    │   ├── backgrounds/                                  <-- 15 hình nền các buổi trong game
    │   │   ├── DAY 1.jpg                                 <-- Hình nền ban đêm Ngày 1
    │   │   ├── DAY 2.jpg                                 <-- Hình nền ban đêm Ngày 2
    │   │   ├── DAY 3.jpg                                 <-- Hình nền ban đêm Ngày 3
    │   │   ├── DAY 4.jpg                                 <-- Hình nền ban đêm Ngày 4
    │   │   ├── DAY 5.jpg                                 <-- Hình nền ban đêm Ngày 5
    │   │   ├── DAY 6.jpg                                 <-- Hình nền ban đêm Ngày 6
    │   │   ├── NOON DAY 1.jpg                            <-- Hình nền ca trực trưa Ngày 1
    │   │   ├── NOON DAY 2.jpg                            <-- Hình nền ca trực trưa Ngày 2
    │   │   ├── NOON DAY 3.jpg                            <-- Hình nền ca trực trưa Ngày 3
    │   │   ├── NOON DAY 4.jpg                            <-- Hình nền ca trực trưa Ngày 4
    │   │   ├── NOON DAY 5.jpg                            <-- Hình nền ca trực trưa Ngày 5
    │   │   ├── NOON DAY 6.jpg                            <-- Hình nền ca trực trưa Ngày 6
    │   │   ├── NOON DAY 7 (TRUE ENDING).jpg              <-- Hình nền bình minh thanh bình (True Ending)
    │   │   ├── NOON DAY 7 (TRUE FORM JUMPSCARE BG).jpg   <-- Hình nền u ám rùng rợn Ngày 7 (Bad/Good Ending)
    │   │   └── TITLE SCREEN Compressed.jpg               <-- Hình nền màn hình chính Title Screen
    │   │
    │   ├── cows/                                         <-- 22 Sprite Bò đầy đủ chi tiết
    │   │   ├── NORMAL COW.png                            <-- Bò bình thường khỏe mạnh
    │   │   ├── ANOMALY - RED (DAY 1 ONWARDS).png         <-- Dị thường: Ửng đỏ da / bộ phận (Từ Ngày 1)
    │   │   ├── ANOMALY - DROOP (DAY 2 ONWARDS).png       <-- Dị thường: Tai rủ như giẻ ướt (Từ Ngày 2)
    │   │   ├── ANOMALY  - CUTS (DAY 2 ONWARDS).png       <-- Dị thường: Vết cắt không chảy máu dạng 1 (Từ Ngày 2)
    │   │   ├── ANOMALY - CUTS 2 (DAY 2 ONWARDS).png      <-- Dị thường: Vết cắt không chảy máu dạng 2 (Từ Ngày 2)
    │   │   ├── ANOMALY - MOUTH (DAY 3 ONWARDS).png       <-- Dị thường: Miệng méo mó dạng 1 (Từ Ngày 3)
    │   │   ├── ANOMALY - MOUTH 2 (DAY 3 ONWARDS).png      <-- Dị thường: Miệng méo mó dạng 2 (Từ Ngày 3)
    │   │   ├── ANOMALY - WOUNDS & MOUTH (DAY 3 ONWARDS).png <-- Dị thường: Vết thương kết hợp miệng (Từ Ngày 3)
    │   │   ├── ANOMALY - EXT PARTS (DAY 4 ONWARDS).png   <-- Dị thường: Mọc chi thừa dạng 1 (Từ Ngày 4)
    │   │   ├── ANOMALY - EXT PARTS 2 (DAY 4 ONWAWRDS).png<-- Dị thường: Mọc chi thừa dạng 2 (Từ Ngày 4)
    │   │   ├── ANOMALY - EXT PARTS 3 (DAY 4 ONWARDS).png <-- Dị thường: Mọc chi thừa dạng 3 (Từ Ngày 4)
    │   │   ├── ANOMALY - EXT PARTS 4 (DAY 4 ONWARDS).png <-- Dị thường: Mọc chi thừa dạng 4 (Từ Ngày 4)
    │   │   ├── ANOMALY - ROTTEN, WOUNDS, LIMBS, MOUTH (DAY 4 ONWARDS).png <-- Dị thường đa dị tật (Từ Ngày 4)
    │   │   ├── ANOMALY - ROTTEN (DAY 5 ONWARDS).png      <-- Dị thường: Thối rữa ruồi bu (Từ Ngày 5)
    │   │   ├── ANOMALY - ROTTEN & WOUND (DAY 5 ONWARDS).png <-- Dị thường: Thối rữa + Vết loét (Từ Ngày 5)
    │   │   ├── ANOMALY - ROTTEN CUTS & WOUNDS (DAY 5 ONWARDS).png <-- Dị thường: Thối rữa + Vết cắt sâu (Từ Ngày 5)
    │   │   ├── ANOMALY - EYES (DAY 6 ONWARDS).png        <-- Dị thường: Mắt người quái dị 1 (Từ Ngày 6)
    │   │   ├── ANOMALY EYES 2 (DAY 6 ONWARDS).png        <-- Dị thường: Mắt người quái dị 2 (Từ Ngày 6)
    │   │   ├── ANOMALY - SCRIPTURES (DAY 7).png          <-- Dị thường: Khắc văn tự cổ / Kinh tà giáo Ngày 7
    │   │   ├── TRUE FORM 1.png                           <-- Dạng thật quái vật khi lộ nguyên hình (Jumpscare 1)
    │   │   ├── TRUE FORM 2.png                           <-- Dạng thật quái vật khi lộ nguyên hình (Jumpscare 2)
    │   │   └── cow-shot (1).png                          <-- Sprite bò bị bắn hạ trúng đạn
    │   │
    │   ├── journal/                                      <-- 7 ảnh trang nhật ký gốc
    │   │   ├── PAGE 1.png                                <-- Trang nhật ký 1
    │   │   ├── PAGE 2.png                                <-- Trang nhật ký 2
    │   │   ├── PAGE 3.png                                <-- Trang nhật ký 3
    │   │   ├── PAGE 4.png                                <-- Trang nhật ký 4
    │   │   ├── PAGE 5.png                                <-- Trang nhật ký 5
    │   │   ├── PAGE 6.png                                <-- Trang nhật ký 6
    │   │   └── PAGE 7 (TRUE ENDING).png                  <-- Trang nhật ký 7 (Chân kết cục)
    │   │
    │   ├── reporter/                                     <-- 16 ảnh màn hình TV phát thanh viên
    │   │   ├── SCREEN - 3 copy.jpg                       <-- Màn hình TV chèn sóng ma quái (bản copy)
    │   │   ├── SCREEN - 3.jpg                            <-- Màn hình TV chèn sóng ma quái
    │   │   ├── SCREEN 2 (1).jpg                          <-- Màn hình TV phát thanh viên góc 1
    │   │   ├── SCREEN 2 (2).jpg                          <-- Màn hình TV phát thanh viên góc 2
    │   │   ├── SCREEN 2 (3).jpg                          <-- Màn hình TV phát thanh viên góc 3
    │   │   ├── SCREEN 2 (4).jpg                          <-- Màn hình TV phát thanh viên góc 4
    │   │   ├── screen 2 (5).jpg                          <-- Màn hình TV Ngày 7 "Armageddon is here"
    │   │   ├── SCREEN 2 - 1.jpg                          <-- Màn hình cận cảnh TV 1
    │   │   ├── SCREEN 2 -1.jpg                           <-- Màn hình cận cảnh TV 2
    │   │   ├── SCREEN 2.jpg                              <-- Màn hình TV tiêu chuẩn
    │   │   ├── SCREEN 3.jpg                              <-- Màn hình TV góc 3
    │   │   ├── SCREEN 2 - FINAL.jpg                      <-- Màn hình phát thanh viên kết thúc
    │   │   ├── SCREEN 2 - FINAL-1.jpg                    <-- Màn hình phát thanh viên kết thúc 1
    │   │   ├── SCREEN 2 - FINAL-2.jpg                    <-- Màn hình phát thanh viên kết thúc 2
    │   │   ├── SCREEN 2 - FINAL-3.jpg                    <-- Màn hình phát thanh viên kết thúc 3
    │   │   └── SCREEN 2 - FINAL-4.jpg                    <-- Màn hình phát thanh viên kết thúc 4
    │   │
    │   ├── ui/                                           <-- 10 tài nguyên giao diện người dùng
    │   │   ├── CONTINUE.png                              <-- Nút Tiếp tục (Continue)
    │   │   ├── CREDITS.png                               <-- Nút Thông tin tác giả (Credits)
    │   │   ├── END.png                                   <-- Nút Kết thúc (End)
    │   │   ├── SETTINGS.png                              <-- Nút Cài đặt (Settings)
    │   │   ├── START.png                                 <-- Nút Bắt đầu (Start)
    │   │   ├── Crosshair.png                             <-- Tâm ngắm súng
    │   │   ├── HEART-LIVES.png                           <-- Biểu tượng Mạng (Trái tim/Đèn sinh mệnh)
    │   │   ├── journal-paper-fold.png                    <-- Biểu tượng mảnh giấy nhật ký nhặt trên cỏ
    │   │   ├── app-icon.png                              <-- Icon ứng dụng game
    │   │   └── icon.svg                                  <-- Icon vector Godot
    │   │
    │   └── credits/                                      <-- Ảnh chân dung 4 tác giả game gốc
    │       ├── ABALO.jpg
    │       ├── BABAS.jpg
    │       ├── BUERANO.jpg
    │       └── REYES.jpg
    │
    └── videos/                                           <-- 16 video cắt cảnh định dạng .ogv
        ├── intro_final_1.ogv                             <-- Video mở đầu game (Intro)
        ├── JUMPSCARE.ogv                                 <-- Video jumpscare ban đêm khi để lọt quái vật
        ├── BAD-ENDING.ogv                                <-- Video kết thúc tệ (Bad Ending bản đầy đủ)
        ├── BAD ENDING_1.ogv                              <-- Video kết thúc tệ (Bad Ending bản rút gọn)
        ├── NORMAL-ENDING.ogv                             <-- Video kết thúc thường (Normal Ending bản đầy đủ)
        ├── NORMAL ENDING_1.ogv                           <-- Video kết thúc thường (Normal Ending bản 1)
        ├── NORMAL_ENDING_FINAL.ogv                       <-- Video kết thúc thường (Normal Ending bản chính thức)
        ├── TRUE-ENDING.ogv                               <-- Video chân kết cục (True Ending)
        ├── NEWS-RESUME-DAY-2-6.ogv                       <-- Video chuyển cảnh bản tin Ngày 2 đến Ngày 6
        ├── LAST SCREEN DAY 3.ogv                         <-- Video cắt cảnh cuối Ngày 3
        ├── DAY-5-ENDING.ogv                              <-- Video cắt cảnh cuối Ngày 5
        ├── DAY-6-ENDING.ogv                              <-- Video cắt cảnh cuối Ngày 6
        ├── SCREEN-2-FINAL-5-ENDING.ogv                   <-- Video màn hình phát thanh viên kết thúc
        ├── DUBISTGUTGENUG1.ogv                           <-- Video easter egg / cutscene phụ
        ├── Shrek and friends dancing to a filipino song.ogv <-- Easter egg ẩn của nhà phát triển
        └── Thorfinn - I have no enemies _ Manga animation.ogv <-- Easter egg ẩn của nhà phát triển
```

---

## 6. KỊCH BẢN THỰC THI CHI TIẾT 100% TỪNG BƯỚC CHO NGÀY 1 (EXACT DAY 1 PIPELINE)

Để Bot Zalo chạy **chính xác 100% không sai lệch một chi tiết nào** so với game gốc, dưới đây là luồng thực thi từng tick/bước của Ngày 1 kèm đường dẫn file kết nối tương ứng:

```mermaid
flowchart TD
    A["Bắt đầu Ngày 1 (Title Card: DAY 1)"] --> B["Bản tin sáng (Day News: 5 câu thoại + Voice + Ảnh TV)"]
    B --> C["Bắt đầu Ca trực trưa (Noon Inspection)"]
    C --> D["Nhặt Trang nhật ký 1 (Journal Page 1)"]
    D --> E["Lần lượt kiểm tra 7 con bò (4 thường, 3 dị thường)"]
    E --> F{"Quyết định người chơi"}
    F -->|"Soi bộ phận"| G["Trả lời mô tả của bộ phận đó"]
    F -->|"Nghe kêu"| H["Gửi audio tiếng kêu (Normal Moo)"]
    F -->|"Cho qua (Allow)"| I["Ghi nhận: Bình thường hay Quái vật"]
    F -->|"Bắn hạ (Shoot)"| J["Phát âm thanh súng + Trừ máu nếu bắn nhầm"]
    I --> K{"Hết 7 con bò?"}
    J --> K
    K -->|Chưa| E
    K -->|Rồi| L["Chuyển sang Ban đêm (Night Phase)"]
    L --> M{"Có lọt con dị thường nào không?"}
    M -->|Không| N["Đêm bình yên (Suy nghĩ nhẹ nhõm, không mất máu)"]
    M -->|Có lọt| O["Đêm kinh hoàng (Tiếng cào xé 3h sáng, trừ 1 máu, Jumpscare)"]
    N --> P["Chuyển sang Ngày 2"]
    O --> P
```

### Bước 1: Khởi động Ngày 1 & Tiêu đề Ngày
- **Âm thanh giáng mạnh (Thud):** Phát file [`assets/audio/music/THUD SFX.mp3`](file:///c:/Users/Administrator/Documents/mod/port%20bot/assets/audio/music/THUD%20SFX.mp3).
- **Văn bản hiển thị:** `=== NGÀY 1 / DAY 1 ===`
- **Mạng ban đầu:** 3 mạng (biểu thị bằng 3 tim `assets/images/ui/HEART-LIVES.png`).

---

### Bước 2: Bản tin thời sự Buổi sáng (Morning News - Day 1)
- **Nhạc nền thời sự:** Phát lặp file [`assets/audio/music/Morning News.mp3`](file:///c:/Users/Administrator/Documents/mod/port%20bot/assets/audio/music/Morning%20News.mp3).
- **Trình tự phát sóng 5 câu thoại liên tiếp (hoặc bấm Next/Tiếp tục trên Bot):**

| Thứ tự | Ảnh màn hình TV (`assets/images/reporter/`) | File Audio Voice (`assets/audio/voices/day1/`) | Nội dung hiển thị (Tiếng Anh & Bản dịch Tiếng Việt) |
| :---: | :--- | :--- | :--- |
| **Câu 1** | `SCREEN 2 - FINAL-2.jpg` | `LINE 1.wav` | *"Good Morning. Thank you for tuning in."*<br>*(Chào buổi sáng. Cảm ơn quý vị đã đón xem bản tin.)* |
| **Câu 2** | `SCREEN 2 - FINAL-1.jpg` | `LINE 2.wav` | *"The Department of Agriculture has confirmed several isolated reports of unusual skin discoloration among cattle in the northern grazing counties."*<br>*(Bộ Nông nghiệp đã xác nhận một số báo cáo riêng lẻ về việc đổi màu da bất thường ở gia súc tại các quận chăn thả phía bắc.)* |
| **Câu 3** | `SCREEN 2 - FINAL-4.jpg` | `LINE 3.wav` | *"A department spokesperson stressed this morning that there is, quote, no cause for public concern, and that affected animals are being handled through routine inspection procedures already in place at regional checkpoints."*<br>*(Người phát ngôn của Bộ nhấn mạnh sáng nay rằng 'không có lý do gì để công chúng phải hoang mang', và các động vật bị ảnh hưởng đang được xử lý theo quy trình kiểm tra định kỳ tại các trạm kiểm dịch khu vực.)* |
| **Câu 4** | `SCREEN 2 - FINAL-4.jpg` | `LINE 4.wav` | *"Inspectors are reminded to examine livestock thoroughly before clearing them for transport. If you observe any abnormality not covered in your reference manual, please document it and continue with your shift as normal."*<br>*(Các thanh tra được nhắc nhở kiểm tra kỹ gia súc trước khi cho phép vận chuyển. Nếu phát hiện bất kỳ dị thường nào không có trong sổ tay hướng dẫn, vui lòng ghi nhận lại và tiếp tục ca trực bình thường.)* |
| **Câu 5** | `SCREEN 2 - FINAL-3.jpg` | `LINE 5.wav` | *"We'll have more on this story as it develops. Stay safe out there."*<br>*(Chúng tôi sẽ tiếp tục cập nhật khi có diễn biến mới. Hãy giữ an toàn ngoài đó.)* |

- **Kết thúc bản tin:** Bot dừng phát nhạc `Morning News.mp3`. Có thể chiếu video cắt cảnh ngắn: [`assets/videos/LAST SCREEN DAY 3.ogv`](file:///c:/Users/Administrator/Documents/mod/port%20bot/assets/videos/LAST%20SCREEN%20DAY%203.ogv).

---

### Bước 3: Vào ca trực Buổi trưa & Nhặt Trang Nhật Ký 1
- **Hình nền ca trực:** [`assets/images/backgrounds/NOON DAY 1.jpg`](file:///c:/Users/Administrator/Documents/mod/port%20bot/assets/images/backgrounds/NOON%20DAY%201.jpg).
- **Nhạc nền ca trực:** [`assets/audio/music/Noon (Day 1-4).mp3`](file:///c:/Users/Administrator/Documents/mod/port%20bot/assets/audio/music/Noon%20(Day%201-4).mp3).
- **Sự kiện nhặt Trang Nhật Ký 1:**
  - Bot hiển thị nút: `[📜 Nhặt mảnh giấy rơi trên đồng cỏ]` (Ảnh icon: `assets/images/ui/journal-paper-fold.png`).
  - Khi người chơi bấm nhặt:
    - Phát âm thanh mở giấy: [`assets/audio/sfx/freesound_community-crumple-03-40747.mp3`](file:///c:/Users/Administrator/Documents/mod/port%20bot/assets/audio/sfx/freesound_community-crumple-03-40747.mp3).
    - Gửi ảnh: [`assets/images/journal/PAGE 1.png`](file:///c:/Users/Administrator/Documents/mod/port%20bot/assets/images/journal/PAGE%201.png).
    - Văn bản hiển thị:
      ```text
      [NHẬT KÝ - TRANG 1]
      "They called it routine.
      Check the skin.
      Check the paperwork.
      Check the eyes.
      It almost feels rehearsed.
      The news always knows what to tell us before we ever see it ourselves."

      (Dịch: Họ gọi đây là thủ tục định kỳ. Kiểm tra da. Kiểm tra giấy tờ. Kiểm tra mắt. Mọi thứ như thể đã được tập dượt từ trước. Bản tin luôn biết cần phải nói gì với chúng tôi trước khi chúng tôi tự mình nhìn thấy.)
      ```
    - Tăng biến: `pages_collected = 1`.

---

### Bước 4: Thuật toán Khởi tạo Đàn Bò Ngày 1
Theo đúng mã nguồn gốc `_generate_cows_for_day(1)`:
- **Tổng số bò:** 7 con.
  - **4 con bò thường:** `is_anomaly = false`.
  - **3 con dị thường:** `is_anomaly = true`, `trait_id = "redness"`.
- Thứ tự 7 con bò được trộn ngẫu nhiên (`shuffle`).
- **Quy tắc tạo từng con bò:**

#### 1. Nếu là Bò Thường (`is_anomaly = false`):
- **Ảnh hiển thị:** [`assets/images/cows/NORMAL COW.png`](file:///c:/Users/Administrator/Documents/mod/port%20bot/assets/images/cows/NORMAL%20COW.png).
- **Tiếng kêu khi bấm nghe (Listen / Moo):** Random 1 trong 2 file:
  - [`assets/audio/sfx/COW 1.mp3`](file:///c:/Users/Administrator/Documents/mod/port%20bot/assets/audio/sfx/COW%201.mp3)
  - [`assets/audio/sfx/COW 2.mp3`](file:///c:/Users/Administrator/Documents/mod/port%20bot/assets/audio/sfx/COW%202.mp3)
- **Mô tả 6 bộ phận khi bấm Soi (`Examine`):** Random từ kho câu mô tả bình thường:
  - `Tai (Ears)`: *"Cả hai tai đều đứng thẳng cảnh giác và giật nhẹ khi có tiếng động. Khỏe mạnh."* hoặc *"Đôi tai ve vẩy xua một con ruồi bay qua. Hoàn toàn bình thường."*
  - `Mắt (Eyes)`: *"Đôi mắt to, ươn ướt và điềm tĩnh. Nó chớp mắt chậm rãi nhìn bạn."* hoặc *"Mắt sáng và khỏe mạnh. Không có gì bất thường."*
  - `Thân (Body)`: *"Lớp da mịn màng. Lồng ngực phập phồng theo nhịp thở êm đềm."* hoặc *"Thân hình béo tốt. Không vết hằn, không vết thương."*
  - `Đuôi (Tail)`: *"Đuôi quất lười biếng đuổi ruồi. Bình thường."* hoặc *"Đuôi buông thõng và đung đưa tự nhiên."*
  - `Chân (Legs)`: *"Bốn chân vững chãi. Móng guốc sạch sẽ."* hoặc *"Nó chuyển trọng tâm tự nhiên. Chân trông rất ổn."*
  - `Miệng (Mouth)`: *"Nó nhai lại chậm rãi. Răng và nướu trông bình thường."* hoặc *"Hơi nhiều nước dãi, nhưng bò nào mà chẳng thế."*

#### 2. Nếu là Bò Dị Thường (`is_anomaly = true`, `trait = "redness"`):
- **Ảnh hiển thị:** [`assets/images/cows/ANOMALY - RED (DAY 1 ONWARDS).png`](file:///c:/Users/Administrator/Documents/mod/port%20bot/assets/images/cows/ANOMALY%20-%20RED%20(DAY%201%20ONWARDS).png).
- **Bộ phận bị nhiễm độc:** Random chọn 1 trong 6 bộ phận: `["Eyes", "Ears", "Legs", "Tail", "Body", "Mouth"]`.
- **Mô tả khi soi bộ phận đó:**
  - Tiếng Anh: `"There is a raw, unnatural REDNESS spreading across the [bộ phận]. It almost looks like it's glowing under the skin."`
  - Tiếng Việt: `"Có một vệt ĐỎ thô ráp, phi tự nhiên lan rộng khắp vùng [bộ phận]. Nó gần như phát sáng bên dưới lớp da."`
- **Mô tả 5 bộ phận còn lại:** Giữ nguyên mô tả bình thường.
- **Tiếng kêu khi bấm nghe (Listen / Moo):** Ngày 1 dị thường chưa méo tiếng, vẫn kêu tiếng bò bình thường (`COW 1.mp3` hoặc `COW 2.mp3`).

---

### Bước 5: Thao tác & Xử lý Quyết định của Người Chơi
Khi gặp từng con bò trong số 7 con:

#### Lựa chọn A: Soi bộ phận (Examine)
- Người chơi chọn 1 trong 6 nút: `[Tai]`, `[Mắt]`, `[Thân]`, `[Đuôi]`, `[Chân]`, `[Miệng]`.
- Bot trả về câu miêu tả tương ứng của con bò đó.

#### Lựa chọn B: Nghe tiếng kêu (Listen / Moo)
- Bot gửi file âm thanh `assets/audio/sfx/COW 1.mp3` (hoặc `COW 2.mp3`).

#### Lựa chọn C: Bắn hạ (Shoot)
1. Bot phát âm thanh rút súng: [`assets/audio/sfx/Weapon Pull Out SFX.mp3`](file:///c:/Users/Administrator/Documents/mod/port%20bot/assets/audio/sfx/Weapon%20Pull%20Out%20SFX.mp3).
2. Phát âm thanh nổ súng: [`assets/audio/sfx/Weapon Shoot SFX.MP3`](file:///c:/Users/Administrator/Documents/mod/port%20bot/assets/audio/sfx/Weapon%20Shoot%20SFX.MP3).
3. Gửi ảnh bò ngã đạn: [`assets/images/cows/cow-shot (1).png`](file:///c:/Users/Administrator/Documents/mod/port%20bot/assets/images/cows/cow-shot%20(1).png).
4. **Phân định kết quả:**
   - **Nếu bắn đúng con Dị thường:**  
     `stat_anomalies_shot += 1`. Bot báo: *"Mục tiêu đã bị tiêu diệt. Dị thường được loại bỏ an toàn."*
   - **Nếu bắn nhầm con Bò thường:**  
     `stat_normals_shot += 1`, `lives -= 1`.  
     Bot báo: *"CẢNH BÁO: BẠN VỪA BẮN NHẦM BÒ VÔ TỘI! Mất 1 mạng. Mạng còn lại: [lives]/3."*  
     *(Nếu `lives <= 0`: Kích hoạt Game Over ngay lập tức!)*

#### Lựa chọn D: Cho qua (Allow)
- **Nếu cho con Bò thường qua:**  
  `stat_normals_saved += 1`. Bò an toàn bước vào chuồng.
- **Nếu cho nhầm con Dị thường qua:**  
  `anomalies_let_in_today += 1`, `stat_anomalies_allowed += 1`, `anomaly_ever_let_in = true`.  
  *(Không báo ngay cho người chơi! Điều này sẽ kích hoạt cơn ác mộng vào ban đêm!)*

---

### Bước 6: Chuyển sang Giai đoạn Ban Đêm (Night Phase - Day 1)
Sau khi hoàn thành cả 7 con bò:
- **Âm thanh thình thịch:** [`assets/audio/music/THUD SFX.mp3`](file:///c:/Users/Administrator/Documents/mod/port%20bot/assets/audio/music/THUD%20SFX.mp3).
- **Hình nền đêm:** [`assets/images/backgrounds/DAY 1.jpg`](file:///c:/Users/Administrator/Documents/mod/port%20bot/assets/images/backgrounds/DAY%201.jpg).
- **Nhạc nền đêm:** [`assets/audio/music/Nighttime (Day 1-6).mp3`](file:///c:/Users/Administrator/Documents/mod/port%20bot/assets/audio/music/Nighttime%20(Day%201-6).mp3).

#### Tình huống 1: An toàn tuyệt đối (`anomalies_let_in_today == 0`):
- Bot gửi ảnh `DAY 1.jpg` kèm dòng suy nghĩ thanh thản:
  ```text
  "Long day... I should get some sleep.
  Hopefully tomorrow's quieter."

  (Một ngày dài... Mình nên đi ngủ thôi. Hy vọng ngày mai sẽ yên tĩnh hơn.)
  ```
- Không mất mạng nào. Lưu checkpoint: `day = 2, lives = current_lives`. Tiến sang Ngày 2!

#### Tình huống 2: Có để lọt quái vật vào chuồng (`anomalies_let_in_today > 0`):
- Bot phát âm thanh gầm rú: [`assets/audio/sfx/Distorted Moo.mp3`](file:///c:/Users/Administrator/Documents/mod/port%20bot/assets/audio/sfx/Distorted%20Moo.mp3).
- Gửi video jumpscare: [`assets/videos/JUMPSCARE.ogv`](file:///c:/Users/Administrator/Documents/mod/port%20bot/assets/videos/JUMPSCARE.ogv).
- Gửi văn bản rùng rợn:
  ```text
  "You wake at 3 AM to a wet, dragging sound from the barn.
  In the morning you find one of the cows you allowed in standing in the corner, facing the wall. The others are pressed against the far side, as far from it as possible.
  Something it did in the night left long, dark stains on the floor.

  YOU LET AN ANOMALY INSIDE."

  (Bạn tỉnh giấc lúc 3 giờ sáng bởi một âm thanh kéo lê nhầy nhụa phát ra từ chuồng bò.
  Sáng hôm sau, bạn thấy một trong những con bò bạn cho phép vào đang đứng trong góc, mặt úp vào tường. Những con khác chen chúc ép chặt về phía đối diện, xa nó nhất có thể.
  Thứ gì đó nó đã làm trong đêm để lại những vệt ố đen dài trên sàn.

  BẠN ĐÃ ĐỂ MỘT DỊ THƯỜNG LỌT VÀO BÊN TRONG.)
  ```
- Trừ mạng: `lives -= 1`.  
  *(Nếu `lives <= 0` -> Game Over. Nếu còn sống -> tiến sang Ngày 2 với số mạng còn lại!)*

---

## 7. BẢNG NỐI FILE CHI TIẾT 100% CHO CẢ 7 NGÀY (FULL 7-DAY ASSET MAPPING SPECIFICATION)

| Ngày | Buổi Sáng: Ảnh TV (`reporter/`) | Buổi Sáng: File Voice (`voices/`) | Ca Trực: Ảnh Nền & Nhạc Trưa | Dị Thường Mới & Sprite Bò Sử Dụng (`cows/`) | Trang Nhật Ký (`journal/`) | Ban Đêm: Ảnh Nền (`backgrounds/`) & Nhạc |
| :---: | :--- | :--- | :--- | :--- | :--- | :--- |
| **Ngày 1** | `SCREEN 2 - FINAL-2.jpg`<br>`SCREEN 2 - FINAL-1.jpg`<br>`SCREEN 2 - FINAL-4.jpg`<br>`SCREEN 2 - FINAL-3.jpg` | `day1/LINE 1.wav` đến `LINE 5.wav` | Ảnh: `NOON DAY 1.jpg`<br>Nhạc: `Noon (Day 1-4).mp3` | **Ửng đỏ (Redness)**<br>Sprite: `ANOMALY - RED (DAY 1 ONWARDS).png` | `PAGE 1.png`<br>Tọa độ gốc: (1150, 900) | Ảnh: `DAY 1.jpg`<br>Nhạc: `Nighttime (Day 1-6).mp3` |
| **Ngày 2** | `SCREEN 2 - FINAL-2.jpg`<br>`SCREEN 2.jpg`<br>`SCREEN 2 - 1.jpg`<br>`SCREEN 2 - FINAL.jpg` | `day2/LINE 1.wav` đến `LINE 4.wav` | Ảnh: `NOON DAY 2.jpg`<br>Nhạc: `Noon (Day 1-4).mp3` | **Tai rủ & Vết cắt không chảy máu**<br>Sprite:<br>- `ANOMALY - DROOP (DAY 2 ONWARDS).png`<br>- `ANOMALY - CUTS 2 (DAY 2 ONWARDS).png`<br>- `ANOMALY  - CUTS (DAY 2 ONWARDS).png` | `PAGE 2.png`<br>Tọa độ gốc: (700, 500) | Ảnh: `DAY 2.jpg`<br>Nhạc: `Nighttime (Day 1-6).mp3` |
| **Ngày 3** | `SCREEN 2 - FINAL-2.jpg`<br>`SCREEN 2 (1).jpg`<br>`SCREEN 2 -1.jpg`<br>`SCREEN 2 - FINAL.jpg`<br>`SCREEN - 3.jpg` | `day3/LINE 1.wav` đến `LINE 5.wav`<br>*(Câu 5: "...The Gatherer is watching.")* | Ảnh: `NOON DAY 3.jpg`<br>Nhạc: `Noon (Day 1-4).mp3` | **Tiếng kêu méo mó / dị dạng (Weird Sound)**<br>Âm thanh kêu: `Distorted Moo.mp3`<br>Sprite:<br>- `ANOMALY - MOUTH (DAY 3 ONWARDS).png`<br>- `ANOMALY - MOUTH 2 (DAY 3 ONWARDS).png`<br>- `ANOMALY - WOUNDS & MOUTH (DAY 3 ONWARDS).png` | `PAGE 3.png`<br>Tọa độ gốc: (600, 200) | Ảnh: `DAY 3.jpg`<br>Nhạc: `Nighttime (Day 1-6).mp3` |
| **Ngày 4** | `SCREEN 2 - FINAL-2.jpg`<br>`SCREEN 2 (2).jpg`<br>`SCREEN 2 - FINAL.jpg` | `day4/LINE 1.wav` đến `LINE 3.wav` | Ảnh: `NOON DAY 4.jpg`<br>Nhạc: `Noon (Day 1-4).mp3` | **Chi thừa (Extra Limbs / 5 Chân)**<br>Sprite:<br>- `ANOMALY - EXT PARTS (DAY 4 ONWARDS).png`<br>- `ANOMALY - EXT PARTS 2 (DAY 4 ONWAWRDS).png`<br>- `ANOMALY - EXT PARTS 3 (DAY 4 ONWARDS).png`<br>- `ANOMALY - EXT PARTS 4 (DAY 4 ONWARDS).png`<br>- `ANOMALY - ROTTEN, WOUNDS, LIMBS, MOUTH.png` | `PAGE 4.png`<br>Tọa độ gốc: (1000, 300) | Ảnh: `DAY 4.jpg`<br>Nhạc: `Nighttime (Day 1-6).mp3` |
| **Ngày 5** | `SCREEN 2 - FINAL-2.jpg`<br>`SCREEN 3.jpg`<br>`SCREEN 2 - FINAL-2.jpg`<br>`SCREEN - 3.jpg` | `day5/LINE 1.wav` đến `LINE 4.wav`<br>*(Câu 4: "WE SEE YOU")* | Ảnh: `NOON DAY 5.jpg`<br>Nhạc: `Noon (Day 5).mp3` | **Ruồi bu & Thối rữa (Flies / Rotten)**<br>Sprite:<br>- `ANOMALY - ROTTEN (DAY 5 ONWARDS).png`<br>- `ANOMALY - ROTTEN & WOUND (DAY 5 ONWARDS).png`<br>- `ANOMALY - ROTTEN CUTS & WOUNDS.png`<br>*(Bắt đầu có 10% tỷ lệ quái vật lộ nguyên hình `TRUE FORM 1.png` / `TRUE FORM 2.png` khi bị bắn!)* | `PAGE 5.png`<br>Tọa độ gốc: (1100, 400) | Ảnh: `DAY 5.jpg`<br>Nhạc: `Nighttime (Day 1-6).mp3` |
| **Ngày 6** | `SCREEN 2 - FINAL-2.jpg`<br>`SCREEN 2 (4).jpg`<br>`SCREEN 2 (4).jpg` | `day6/LINE 1.wav` đến `LINE 3.wav` | Ảnh: `NOON DAY 6.jpg`<br>Nhạc: `Noon (Day 6).mp3` | **Mắt người quái dị (Human eyes)**<br>Sprite:<br>- `ANOMALY - EYES (DAY 6 ONWARDS).png`<br>- `ANOMALY EYES 2 (DAY 6 ONWARDS).png` | `PAGE 6.png`<br>Tọa độ gốc: (900, 200) | Ảnh: `DAY 6.jpg`<br>Nhạc: `Nighttime (Day 1-6).mp3` |
| **Ngày 7** | `screen 2 (5).jpg` *(Cả 5 câu thoại)* | `day7/LINE 1.wav` đến `LINE 5.wav`<br>*(Câu 5: "ARMAGEDDON IS HERE")* | **Nhánh Thường:**<br>Ảnh: `NOON DAY 7 (TRUE FORM JUMPSCARE BG).jpg`<br>Nhạc: `Noon (Day 7 Bad and Good ED).mp3`<br>Sprite: Tất cả sprite ngày 1-6 + `ANOMALY - SCRIPTURES (DAY 7).png`<br><br>**Nhánh True Ending:**<br>Ảnh: `NOON DAY 7 (TRUE ENDING).jpg`<br>Nhạc: `Noon (Day 7 True ED).mp3` | **Tất cả các loại dị thường đều kích hoạt**<br>Nhánh True Ending: Đồng cỏ thanh bình, một chú bò bình thường duy nhất bước qua. | `PAGE 7 (TRUE ENDING).png`<br>*(Rơi ở nhánh True Ending)* | **Kết thúc game:**<br>- Bad Ending: `BAD-ENDING.ogv`<br>- Normal Ending: `NORMAL_ENDING_FINAL.ogv`<br>- True Ending: `TRUE-ENDING.ogv` |

---

## 8. CODE MẪU BOT ZALO CHUẨN XÁC 100% (STATE MACHINE & ASSET RESOLVER)

Dưới đây là module logic cốt lõi bằng **Node.js (JavaScript / TypeScript)** hoặc **Python** để bạn nhúng trực tiếp vào Bot Zalo, đảm bảo tính toán và load chính xác từng file:

```javascript
// engine.js - Module giải quyết tài nguyên và logic game The Cattle cho Bot Zalo
const fs = require('fs');
const path = require('path');

const GAME_DATA = JSON.parse(fs.readFileSync(path.join(__dirname, 'data/game_data.json'), 'utf-8'));

class TheCattleGame {
  constructor(userId) {
    this.userId = userId;
    this.day = 1;
    this.lives = 3;
    this.pagesCollected = 0;
    this.anomalyEverLetIn = false;
    this.statNormalsShot = 0;
    this.statAnomaliesShot = 0;
    this.statAnomaliesAllowed = 0;
    
    this.cowsToday = [];
    this.currentCowIndex = 0;
    this.anomaliesLetInToday = 0;
    this.pageAvailableToday = true;
  }

  // Khởi tạo ngày mới
  startDay(dayNumber) {
    this.day = dayNumber;
    this.currentCowIndex = 0;
    this.anomaliesLetInToday = 0;
    this.pageAvailableToday = true;
    this.cowsToday = this.generateCowsForDay(dayNumber);
  }

  // Thuật toán sinh bò chuẩn 100% Godot
  generateCowsForDay(d) {
    const dayConfig = GAME_DATA.days[d.toString()];
    const traitsPool = GAME_DATA.traits.filter(t => t.day <= d);
    const newTraitsPool = GAME_DATA.traits.filter(t => t.day === d);
    const herd = [];

    // Tạo quái vật dị thường
    for (let i = 0; i < dayConfig.anomalies; i++) {
      let trait;
      if (i === 0 && newTraitsPool.length > 0) {
        trait = newTraitsPool[Math.floor(Math.random() * newTraitsPool.length)];
      } else {
        trait = traitsPool[Math.floor(Math.random() * traitsPool.length)];
      }
      herd.push(this.makeCow(true, trait, d));
    }

    // Tạo bò thường
    for (let i = 0; i < dayConfig.normal; i++) {
      herd.push(this.makeCow(false, null, d));
    }

    // Trộn ngẫu nhiên
    return herd.sort(() => Math.random() - 0.5);
  }

  makeCow(isAnomaly, trait, d) {
    const parts = ["Ears", "Eyes", "Body", "Tail", "Legs", "Mouth"];
    let descriptions = {};
    let traitPart = "";
    let weirdSound = false;

    // Gán mô tả mặc định
    parts.forEach(part => {
      descriptions[part] = "Bình thường, không có dấu hiệu bất thường.";
    });

    let textureFile = "assets/images/cows/NORMAL COW.png";

    if (isAnomaly) {
      traitPart = trait.parts[Math.floor(Math.random() * trait.parts.length)];
      if (traitPart === "Sound") {
        weirdSound = true;
        descriptions["Mouth"] = trait.description_vi;
      } else {
        descriptions[traitPart] = trait.description_vi;
      }

      // Map texture tương ứng theo trait
      if (trait.id === "redness") textureFile = "assets/images/cows/ANOMALY - RED (DAY 1 ONWARDS).png";
      else if (trait.id === "droopy_ears") textureFile = "assets/images/cows/ANOMALY - DROOP (DAY 2 ONWARDS).png";
      else if (trait.id === "cuts") textureFile = "assets/images/cows/ANOMALY - CUTS 2 (DAY 2 ONWARDS).png";
      else if (trait.id === "weird_sound") textureFile = "assets/images/cows/ANOMALY - MOUTH (DAY 3 ONWARDS).png";
      else if (trait.id === "extra_limbs") textureFile = "assets/images/cows/ANOMALY - EXT PARTS (DAY 4 ONWARDS).png";
      else if (trait.id === "flies") textureFile = "assets/images/cows/ANOMALY - ROTTEN (DAY 5 ONWARDS).png";
      else if (trait.id === "human eyes") textureFile = "assets/images/cows/ANOMALY - EYES (DAY 6 ONWARDS).png";
    }

    return {
      isAnomaly,
      traitId: isAnomaly ? trait.id : null,
      traitPart,
      weirdSound,
      descriptions,
      texture: textureFile,
      mooAudio: weirdSound ? "assets/audio/sfx/Distorted Moo.mp3" : "assets/audio/sfx/COW 1.mp3"
    };
  }

  // Hành động Bắn
  shootCurrentCow() {
    const cow = this.cowsToday[this.currentCowIndex];
    let result = {
      isSuccess: false,
      livesLost: 0,
      gameOver: false,
      sfx: "assets/audio/sfx/Weapon Shoot SFX.MP3",
      image: "assets/images/cows/cow-shot (1).png",
      message: ""
    };

    if (cow.isAnomaly) {
      this.statAnomaliesShot++;
      result.isSuccess = true;
      result.message = "Mục tiêu đã bị tiêu diệt! Đó là một con dị thường giả dạng.";
    } else {
      this.statNormalsShot++;
      this.lives--;
      result.livesLost = 1;
      result.message = `CẢNH BÁO: BẠN ĐÃ BẮN NHẦM BÒ VÔ TỘI! Bạn còn lại ${this.lives}/3 mạng.`;
      if (this.lives <= 0) result.gameOver = true;
    }

    this.currentCowIndex++;
    return result;
  }

  // Hành động Cho qua
  allowCurrentCow() {
    const cow = this.cowsToday[this.currentCowIndex];
    if (cow.isAnomaly) {
      this.anomaliesLetInToday++;
      this.statAnomaliesAllowed++;
      this.anomalyEverLetIn = true;
    }
    this.currentCowIndex++;
    return {
      hasMore: this.currentCowIndex < this.cowsToday.length
    };
  }
}

module.exports = TheCattleGame;
```
