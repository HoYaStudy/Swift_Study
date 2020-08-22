# SwiftUI

## Modifier

`Modifier`를 적용할 때는 순서에 주의해야 한다.

`Return type`을 잘 보고 chaining을 해야한다.

`Modifier`는 이전 view를 감싼 새로운 view를 만들어 내고, 그 다음 `modifier`는 다시 그 view를 감싼다. 따라서 순서에 따라 결과가 달라질 수 있다.
