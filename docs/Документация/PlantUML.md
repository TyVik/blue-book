- [The Hitchhiker’s Guide to PlantUML!](https://crashedmind.github.io/PlantUMLHitchhikersGuide/index.html)
- [C4-PlantUML](https://github.com/plantuml-stdlib/C4-PlantUML)

---
Основной принцип для описания компонентов гласит: в самих схемах новые сущности объявлять нельзя. Они должны быть объявлены в отдельном файле и импортированы в нужные схемы. Таким образом мы сохраняем единство наименований и описаний. Другой, не менее важный принцип – переиспользование кода в виде архитектурных паттернов. Зачастую наши сервисы и процессы похожи друг на друга, и чтобы не тратить время на рисование в целом идентичных диаграмм, мы используем библиотеку паттернов, вроде типовых микросервисов или бизнес-операций.

В результате это позволяет написать несколько строчек PlantUML-кода…

```
@startuml
!include domain/patterns/c4/microservice_archetype.puml
$microservice_archetype(yet_another_service, "Микросервис настроек",     
yet_another_backend.puml, yet_another_frontend.puml, yet_another_db.puml,     
yet_another_backend, yet_another_frontend, yet_another_db)
@enduml
```