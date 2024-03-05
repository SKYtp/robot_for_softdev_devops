# Robot Framwork for Simple API

### Run Robot
`robot test-plus.robot`

### command ที่ใช้
git clone 
git checkout
git branch [ชื่อกิ่งใหม่] [กิ่งที่ต้องการแตก]
git push origin [กิ่งที่ต้องการ merge ด้วย]
git git add .
git commit -m [ชื่อการอัพเดต]

### เริ่มจาก
git clone [url]

### แตกกิ่ง dev
git branch dev main

### ย้ายไปกิ่ง dev (กรณีที่มีแล้ว)
git checkout dev

### สร้าง branch ตัวเอง
git branch [ชื่อกิ่งใหม่] [กิ่งที่ต้องการแตก]
git checkout [ชื่อกิ่งใหม่] 
git push -u origin [ชื่อกิ่งใหม่]

### จากนั้นก็แก้ไฟล์ๆ เพิ่มสิ่งที่แก้ลงไปในกิ่งที่เราทำ (จากที่อยู่ใน origin หรือ อันที่ทำให้ workspace)
git add .
git commit -m '[ตรงนี้จะเป็น comment ว่าแก้ไขอะไรไปใน branch จะเขียนเป็นชื่อ branch ก็ได้ถ้าไม่มึน-]'
[optional] git status <- เช็คว่าอยู่กิ่งไหน แก้อะไรไปบ้าง
git push -u origin [ชื่อ branch]

### จากนั้นเราจะมา merge branch ที่เราเพิ่งแก้ไป กับ dev
git checkout dev
git merge --no-ff [ชื่อ branch]
git push origin dev
