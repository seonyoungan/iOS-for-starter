### 🍏 iOS-for-starter

#### 1. Storyboard
1. 사용자에게 보여질 화면 미리보기
2. 어떤 컨트롤을 통해 다음 화면으로 이동될 것인지 = UX 흐름
3. 인터페이스 빌더를 사용해 스토리 + xib폴더 관리 가능
    
#### 2. UIKit
1. UIkit: 사용자와 인터랙션할 수 있는 모든 것들의 모음집
    
#### 3. Event Driven Programming
1. 사람 손으로 터치 -> 앱 메인단 무한루프 -> 처리 -> 사용자에게 화면 및 소리로 응답해줌
2. 처리부분에서 이벤트 기반으로 코드를 통해 기능 만듦
    
    
    
#
### 🍎 swift-grammar
### <1> 변수와 상수
#### 1. varable and constant
1. 변수: 값수정 가능
2. 상수: 값 수정 불가 (변경코드 작성시 컴파일 에러)
3. 스위프트에서는 일반적으로 상수 사용을 권장함 (let)
4. _ : 어디에서나 변수 이름 대신 사용할 수 있는 keyword
```swift
var name = "hello, world"
let birthyear = 2022


name = "hi" //가능
birthyear = 2015 //컴파일 에러
```

#### 2. Static typing
1. 컴파일시 타입이 결정됨, 즉 명시적 타입
2. 다른 타입의 언어들 간 연산 불가 -> 강제형변환 해주어야 한다.
```swift
var name: String = "hello, world"
let birthyear: Int = 2022
var height: Float = 198.7

birthyear + height //컴파일 에러
Float(birthyear) + height //가능

print(String(birthyear) + "년에 태어난 " + String(name) + "아, 안녕") //2022년에 태어난 hello-world아, 안녕

// `\(변수명)`으로 간단하게 출력할 수도 있다.
print("\(birthyear)년에 태어난 \(name)아, 안녕")  //2022년에 태어난 hello-world아, 안녕
```

#### 3. Type Inference
1. " "로 감싸진 텍스트는 `String`으로 추론
2. 숫자는 `Int`로 추론

#### 4. Array and Dictionary
1. `[]`로 정의할 수 있음
```swift
var languages = ["Swift", "Object-C"]
var capitals = [
    "한국": "서울",
    "일본": "도쿄",
    "중국": "베이징",
]

print(languages[0]) // Swift
print(languages[1]) //Object-C
```

2. 빈 배열, 딕셔너리 정의하기
```swift
var languages: [String] = []
var capitals: [String: String] = [:]

//간결하게 정의하기
var languages = [String]()
var capitals = [String: String]()
```

### <2> 조건문과 반복문
1. if문
```swift
var age = 10
var student = ""

if age >= 8 && age < 13{
    student = "초등학생"
} else if age < 17{
    student = "중학생"
} else if age < 20{
    student = "고등학생"
} else {
    student = "기타"
}

print(student) //초등학생
```

2. if문의 조건절은 Bool타입으로 사용한다.
```swift
if !age{ // 컴파일 에러
    // ...
} 

if age == 0{ //가능
    // ...
}
```

3. switch문
4. 일반적인 `switch문`과 다른점 : 단순히 값이 `같은 지`만 검사하는 것 뿐만 아니라 `패턴매칭`이 가능하다
```swift
var age = 10
var student = ""

switch age {
case 8..<14:
  student = "초등학생"
case 14..<17:
  student = "중학생"
case 17..<20:
  student = "고등학생"
default:
  student = "기타"
}

print(student) //초등학생
```

5. for, while
```swift
var languages = ["Swift", "Object-C"]
var capitals = [
    "한국": "서울",
    "일본": "도쿄",
    "중국": "베이징",
]

for language  in languages{
    print("저는 \(language) 언어를 다룰 수 있습니다.")
}

for(contry, capital) in capitals{
    print("\(contry)의 수도는 \(capital) 입니다.")
}

for i in 0..<2 { // 부터의 의미
  print(i)
}

for _ in 0..<3 { // 변수 i를 사용하지 않고 단순 반복하고 싶다면, _를 사용해 무시할 수 있음
  print(hello)
}
```

```swift
var i = 0
while i < 100{
    i+= 1
} //while이 true일 때까지 계속 반복됨
```

### <3> Optional
1. 직역: 선택적
2. 의미: 값이 있을수도, 없을수도 있는 것
    - 없는 문자열: `nil`
3. 모든 변수에 nil을 붙일 수 있을까요? -> no
```swift
var name1: String = "이름1"
name = nil 
print(name) //컴파일에러 ( 타입 어노테이션에 ?를 붙여아 한다.)

var name2: String? = "이름2"
name = nil 
print(name) //가능

```

4. 옵셔널 바인딩: 옵셔널 값을 가져오고 싶을 때
    - 옵셔널 값이 존재하는지 검사한 뒤, 존재한다면 그 값을 다른 변수에 대입시켜줌
```swift
if let name2 = optionalName{ //값이 존재하면 해당값 출력
    print(name2)
} //값이 존재하지 않으면 if문을 지나침

// 여러개인 경우 콤마로 구분하여 옵셔널 바인딩
var optionalName: String? = "이름3"
var optionalEmail: String? = "a@ngmail.com"

if let name = optionalName, email = optinalEmail{
    //name과 email 값이 존재
}

//코드가 긴 경우
if let name = optionalName,
  let email = optionalEmail {
  // name과 email 값이 존재
} //참고! 두번째 let부터 생략이 가능하다

//위와 동일한 코드
if let name = optionalName {
  if let email = optionalEmail {
    // name과 email 값이 존재
  }
}
```

5. 옵셔널 체이닝
```swift
//일반적인 빈배열 검사
let array: [String]? = []
var isEmptyArray = false

if let array = array, array.isEmpty}
    isEmptyArray = true
} else{
    isEmptyArray = false
}
print(isEmptyArray)

//옵셔널 체이닝으로 빈배열 검사
let isEmptyArray = array?.isEmpty = true
```

6. 옵셔널 벗기기: `!` 키워드 붙여서 사용
    - 주의! 값이 없는데 접근 시도하면 런타임에러 발생
    - 가급적! 일반적 옵셔널을 사용해 정의, 옵셔널 바인딩 또는 옵셔널 체이닝을 통해 접근하는 것이 바람직하다.
```swift
print(optionalEmail) //Optional("a@gmail.com")
print(optionalEmail!) // a@gmail.com
```

#
프로젝트 출처: https://www.youtube.com/c/yagom   
문법공부 출처: https://devxoul.gitbooks.io/ios-with-swift-in-40-hours/content/
