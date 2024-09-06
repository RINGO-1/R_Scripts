x = 1:10
arr = array(x, dim=c(2,5))
# 배열은 설정된 행과 열의 개수로만 저자옹간이 제공됨
arr

# 2차원 배열: 행과 열에 이름을 설정
names = list(c("김판석", "이영호", "박나래"), c("수학", "영어"))
scores = c(88, 92, 95, 100, 97, 91)
arr = array(scores, dim = c(3, 2), dimnames = names)
arr

# 특정 위치에 저장된 값을 변경
arr[3, 2] = 100
arr

# 특정 행의 데이터만 출력
arr[1]

# 특정 열의 데이터만 출력
arr[, 1]

# 특정위치의 값만 출력
arr[3, 1]


# ==============================
# 행열(matrix)
# 행의 갯수만 설정하면 열의 갯수는 자동으로 저장할 데이터만큼 설정됨

x = 1:12
mtx = matrix(x, nrow = 3)
mtx

mtx = matrix(x, nrow = 2)
mtx

# 행과 열의 이름, 지정 데이터가 저장되는 순서를 행우선으로 설정
x = 1:6
names = list(c("김관석", "이영호"), c("수학", "영어", "국어"))
mtx = matrix(x, nrow = 2, dimnames = names, byrow = TRUE)
mtx

# 기존의 행열에 행 추가
y = c(7, 8, 9)
mtx = rbind(mtx, y)
rownames(mtx)[3] ="박나래"
mtx

# 기존의 행열에 열 추가
y=c(10, 11, 12)
mtx=cbind(mtx, y)
colnames(mtx)[4] = "과학"
mtx

# ==============================
# 리스트

lst1 = list(성명 = "장발장", 나이 = 40, 성적 = c(70, 80))
lst1

lst1.gender = list(성별 = "남")
lst1 = append(lst1, lst1.gender, after = 1)
lst1

lst2 = list(성명 = "팡틴", 성별 = "여", 나이 = 20, 성적 = c(90, 95))
lst2 

# 2개 이상의 리스트를 합칠 때
listTotal = list(lst1, lst2)
listTotal

# 팡틴에 관련된 리스트의 내용만 출력
listTotal[2]
listTotal[[2]]

# 팡틴의 성명만 출력하고 싶을 때
listTotal[[2]][1]
listTotal[[2]][[1]]
listTotal[[2]]$성명

# 팡틴에 관련된 두번째 요소의 모든 내용을 출력
listTotal[2][1]

# =============================
# 데이터프레임
# 2차원 형태의 테이블 구조에 데이터를 저장
df = data.frame(성명 = c("장발장", "자베르"), 성별 = c("남", "남"), 나이 = c(40, 45), 수학 = c(88, 99))
df

# 데이터프레임의 구조 확인
str(df)

# 데이터프레임에 열단위 데이터 추가
df = cbind(df, 음악 = c(80, 75))
df

# 데이터프레임에 행단위 데이터 추가
df = rbind(df, data.frame(성명 = "팡틴", 성별 = "여", 나이 = 20, 수학 = 95, 음악 = 98))
df

# 데이터프레임에 저장된 요소의 값을 출력
# 자베르의 나이 (행과 열)
df[2,3]

# 1행의 데이터
df[1]

# 4열의 데이터
df[, 4]

# 1, 3행의 데이터 (2행 제외)
df[-2, ]

# 3열만 제외한 데이터
df[, -3]

# 자베르의 성별을 변경
df[2, 2] = "여"
df