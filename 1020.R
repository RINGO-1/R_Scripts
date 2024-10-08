library(ggplot2)

url <- "https://raw.githubusercontent.com/cran/BTYD/master/data/cdnowElog.csv"

data <- read.csv(url, header=T)

head(data)

quantity  = data$cds

quantity

k = nclass.Sturges(quantity)

ggplot(data = data, aes( x=quantity)) +
  geom_histogram(col = "black", fill="pink", bins = k) +
  labs(title = "거래량에 따른 빈도수", x = "거래량", y = "빈도수")

install.packages("gganimate")
install.packages("gifski")

library(gganimate)
library(ggplot2)
library(gifski)

# .1분기 데이터 프레임
dept = c("영업1팀", "영업2팀", "영업3팀")
sales =  c(12, 5, 8)
df1 = data.frame(부서=dept, 매출=sales, 분기="1분기")
df1

# .2분기 데이터프레임
sales = c(10,8, 5)
df2 = data.frame(부서=dept, 매출=sales, 분기="2분기")
df2

# 각 데이터프레임을 행으로 연결
df = rbind(df1, df2)
df

# 막대그래프 그리기
anim=ggplot(df, aes(x=부서, y=매출, fill=분기))+
  geom_bar(stat="identity")+
  labs(title = "부서별 분기별 영업실적")+
  transition_states(분기)

# 애니메이션 효과설정 및 실행
animate(anim, width=300, height=200, duration=3, renderer=gifski_renderer(loop = FALSE))


# 기본 제공 뭇꽃 데이터셋
iris

# 산포도 그래프 그리기
anim = ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, fill=Species, color=Species))+
  geom_point(size=3, alpha=0.5)+
  labs(title ="꽃받침크기와 종의 분포도",  x ="꽃받침 길이", y="꽃받침 너비")+
  transition_states(Species)

# 애니메이션 설정과 실행
animate(anim, width=400, height=300, duration=0.3, renderer = gifski_renderer(loop = TRUE))

#  ======================================  #

month = c(1, 2, 3, 4, 5, 6)
sales = c(3, 3, 5, 5, 7, 4)
df1 = data.frame(부서="영업 1팀", 월=month, 매출=sales)
df1

# .2분기 데이터프레임
sales = c(2, 2, 4, 8, 9, 6)
df2 = data.frame(부서="영업 2팀", 월=month, 매출=sales)

# 각 데이터프레임을 행으로 연결
df = rbind(df1, df2)
df

# 선그래프 
anim = ggplot(data=df, aes(x=월, y=매출, group=부서))+
  geom_line(aes(color=부서), size=2)+
  geom_point(aes(color=부서), size=5, alpha=0.5)+
  labs(title="부서별 월별 매출액", x="월", y="매출액(억원)")+
  transition_reveal(월)

animate(anim, width=500, height=400, duration=10, renderer = gifski_renderer(loop=TRUE))