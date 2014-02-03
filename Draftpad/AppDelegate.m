//
//  AppDelegate.m
//  Draftpad
//
//  Created by Bruno Fernandes on 13/01/14.
//  Copyright (c) 2014 Paper Street Apps. All rights reserved.
//

#import "AppDelegate.h"
#import "DPAAlbum.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   
    /*
     KOGA: isso aqui já vem no Template... ignora por enquanto
     */
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //Aqui, chamada de método básica em Objective-C
    //"self" representa a instância desse objeto.
    //-firstExample é o método declarado abaixo.
    //Não se preocupe ainda com o "-", nem com o "void" nem nada assim.
    //O ponto aqui é entender que essa linha abaixo chama o método
    //que está implementado na linha 35.
    [self firstExample];
    [self secondExample];
    
    [self thirdExample];
    
    return YES;
}

- (void)firstExample
{
    /*
     Não se preocupe se você não entender ou se achar
     difícil de ler. Objective-C é estranho no começo mesmo
     e essa não é a intenção agora.
     Vamos primeiro tentar criar familiaridade para que você
     entenda os exemplos, mesmo que depois, quando você for fazer sozinho
     demore 10 horas.
     */
    
    //É assim que declaramos uma NSString. Essa @ na frente faz parte
    //de um treco chamado "Literals". Você vai se acostumar com isso.
    //Literals é só uma forma de facilitar a inicialização de objetos,
    //mas não se preocupe. Por enquanto, aprenda só a inicializar uma NSString:
    NSString *filename = @"nin_top_albums.json";
    
    //Isso é complicado mesmo, mas estamos indo no "main bundle" do app
    //e procurando o path para o arquivo que declaramos acima.
    //Não se preocupe muito com isso por enquanto.
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:nil];
    
    //Estamos alocando um NSData, que é a entidade do Foundation responsável
    //por arquivos (array de bytes) e coisas do tipo.
    //Veja como a verbosidade do Objective-C facilita a entender o que
    //está acontecendo, mesmo que você não saiba programar:
    NSData *file = [[NSData alloc] initWithContentsOfFile:path];
    
    //Aqui, estamos iniciando um NSDictionary usando uma classe chamada
    //NSJSONSerialization. Lembre-se que Option+Click em cima de qualquer
    //classe ou método no Xcode te traz a documentação. A partir da janelinha que aparece,
    //Você pode acessar diretamente o .h da classe (API Pública) e
    //a documentação oficial. Try it (tanto para a Classe quanto pro método)!
    
    //Se o Inspector tiver aberto (CMD+Option+2), voce pode deixar o cursor
    //em cima da classe ou método que ele te traz essas informações também.
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:file
                                                               options:0
                                                                 error:nil];
    //É assim que logamos um objeto. Sintaxe chata, mas é assim.
    //Essa é a primeira coisa que vc tem qu se acostumar.
    //Veja no console o conteúdo do nosso dicionário!
    NSLog(@"%@",dictionary);
}

- (void)secondExample
{
    /*
     Para que possamos usar uma classe no nosso código, precisamos usar o #import
     (veja lá em cima, na linha 10). Caso não coloquemos o #import, vamos ter um erro
     de compilação, onde o nosso querido LLVM falaria: "Não sei o que significa DPAAlbum"
     */
    
    /*
     Pré-ARC, utilizávamos 2 passos: alocação e inicialização. Ou seja, escreveríamos
     nosso código dessa forma:
     
     DPAAlbum *album = [[DPAAlbum alloc] init];
     
     que é a mesma coisa que: (veja se faz sentido pra você)
     DPAAlbum *album = [DPAAlbum alloc];
     album = [album init];
     
     Mas com ARC isso fica um pouco fora de contexto, já que não precisamos mais
     ficar prestando atenção nos objetos que alocamos. Então, muita gente tem preferido,
     ao invés de usar alloc e init, usar simplesmente o método +new, que é a mesma coisa:
     */
    DPAAlbum *album = [DPAAlbum new];
    
    /*
     agora temos um objeto do tipo DPAAlbum alocado e inicializado na nossa variável local "album".
     variável local = variável que vive dentro do escopo de um método.
     Vendo o .h de DPAAlbum, sabemos que essa classe possui algumas properties (que por enquanto
     são todas do tipo NSString). Para *setar* essas propriedades, podemos usar os métodos que
     o LLVM cria automaticamente para nós (os setters). Veja:
     */
    [album setName:@"Let Go"];
    [album setArtist:@"Avril Lavigne"];
    [album setImage:@"qualquer_coisa.png"];
    [album setUrl:@"https://www.facebook.com/AvrilOurPrincess"];
    [album setTracks:@[@"Track 1", @"Track 2", @"Track 3"]];
    
    /*
     Em muitas linguagens (tipo JAVA), conseguimos acessar as iVars diretamente.
     O Objective-C proíbe isso. Ou seja, **só conseguimos acessar iVars de um objeto
     de duas formas: 1) usando métodos (como, por exemplo, os acessor methods) ou
     2) de dentro da própria implementação da classe. Isso é o encapsulamento.
     
     No JAVA, acessamos as iVars diretamente usando a dot notation. Algo desse tipo:
     */
    album.name = @"Under My Skin";
    
    /*
     Porém, em Objective-C o compilador SUBSTITUI esse nosso código. Ou seja
     o código acima é EXATAMENTE a mesma coisa que:
     (isso é bem importante)
     */
    [album setName:@"Under My Skin"];
    
    /*
     Da mesma forma, usamos os getters para acessar as variáveis. Em 90% das linguages,
     os getters seguem a mesma notação dos setters (algo do tipo [album getName]). 
     Em Objective-C, por causa da forma como se lê o código, o "get" não existe. Então,
     para acessar uma property, fazemos (note que o método criado tem o mesmo nome da
     própria property):
     */
    NSString *albumName = [album name];
    
    /*
     E, usando a dot notation, podemos fazer também:
     LEMBRE-SE: estamos chamando um método -name ! NÃO estamos
     acessando a iVar chamada "name" (como em outras linguagens)
     */
    
    NSString *artistName = album.artist;
    
    /*
     Perceba também que a dot notation é SETTER ou GETTER
     dependendo de que lado do = ela está.
     Antes do = ela é setter,
     Depois do = ela é getter.
     */
    
    /*
     Logando nossas variáveis locais, apenas para você se 
     acostumar com a notação do NSLog:
     %@ = placeholder pra string
     \n = line break
     */
    
    NSLog(@"\nArtista: %@\nÁlbum: %@", artistName, albumName);
}

- (void)thirdExample
{
    /*
     
     Uma das partes mais importantes da programação - muitas vezes mais importante
     que o próprio código em si - é a forma como o código é organizado.
     
     Existe um princípio chamado Single Responsability Principle - http://en.wikipedia.org/wiki/Single_responsibility_principle
     que nos fala que, utilizando orientação a objetos, devemos sempre
     fazer com que nossas classes tenham **uma única responsabilidade**.
     Em outras palavras, devemos quebrar o máximo possível nosso código em várias classes.
     Isso facilita manutenção e modularidade, além de ajudar em dois outros conceitos 
     importantes dentro de OO: alta coesão e baixo acoplamento 
     - http://en.wikipedia.org/wiki/Cohesion_(computer_science)
     - http://en.wikipedia.org/wiki/Coupling_(computer_programming)
     
     Essas leituras serão um tanto quanto abstratads, mas vai nos ajudar para que, a partir de agora
     pensemos sempre em como/onde vamos escrever nosso código.
     
     Um exemplo bem feito de SOR nesse momento é a nossa classe de DPAlbum, que tem uma única responsabilidade:
     representar um objeto real no nosso programa (ou seja, é uma entidade).
     
     Um exemplo mal feito de SOR no nosso projeto é essa classe aqui (AppDelegate). Afinal, qual é a responsabilidade
     dessa classe? Segundo a documentação da Apple:
     
     "The app delegate is a custom object created at app launch time, usually by the UIApplicationMain function. The primary job of this object is to handle state transitions within the app. For example, this object is responsible for launch-time initialization and handling transitions to and from the background. For information about how you use the app delegate to manage state transitions, see “Managing App State Changes.”
     In iOS 5 and later, you can use the app delegate to handle other app-related events. The Xcode project templates declare the app delegate as a subclass of UIResponder. If the UIApplication object does not handle an event, it dispatches the event to your app delegate for processing. For more information about the types of events you can handle, see UIResponder Class Reference." - https://developer.apple.com/library/ios/documentation/iphone/conceptual/iphoneosprogrammingguide/AppArchitecture/AppArchitecture.html
     
     Logo, o que podemos notar aqui? Que nossos exemplos estão no lugar errado!
     
     Exercício: refatorar nosso código para que todos esses exemplos fiquem em classes separadas. Aconselho:
     
     1) Criar uma superclasse (Por exemplo: DPExemple) com apenas um método no .h: - (void)runExample. A implementação desse método (.m) deve ser vazia (!!!!),
     ou seja: assim:
     
     - (void)runExample { }
     
     2) Criar 3 subclasses (cada uma com seus próprios .h e .m) de DPExemple: DPFirstExample, DPSecondExample, DPThirdExample. Essas subclasses não precisam declarar
     **nenhum** método no .h, mas devem implementar (.m) o método - (void)runExample. Para isso, copie o conteúdo dos métodos que estão nessa classe aqui
     para suas respectivas classes. (Lembre-se: os métodos devem todos se chamar -runExample ao invés de -firstExample, -secondExample e -thirdExample). 
     PS - um dos exemplos vai ter um erro de compilação. Tente entender o erro e a solução.
     
     3) Entender o que fizemos aí em cima. Em poucas palavras, nós criamos uma classe abstrata, que define um método mas não o implementa.
     Cada subclasse dessa classe abstrata, então, implementa o método como achar melhor. Tente fazer outras analogias, como, por exemplo, num joguinho.
     Imagine que a classe abstrata seja "Personagem" e ela defina o método "-movimentar". Imagine que você tem 3 subclasses: golfinho, pássaro e tartaruga.
     Cada uma dessas classes implementa o método "-movimentar" de uma forma totalmente diferente, mas para o cara que vai chamar esses métodos, isso fica transparente.
     Ou seja, no seu programa vc simplesmente vai falar: "[gofinho movimentar]" ou "[pássaro movimentar]". A **responsabilidade** de como esse
     personagem vai, de fato, executar a tarefa dele é do próprio personagem (objeto) e não de quem chama a tarefa (método).
     
     4) Agora podemos deixar nosso AppDelegate bem mais enxuto. Podemos deixar apenas o método "- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions" que é o primeiro método que é chamado após a aplicação ter sido executada.
     
     5) Para cada exemplo, queremos fazer o seguinte:
    
        DPExample *example1 = [DPFirstExample new];
        [example1 runExample];
     
        Note que:
        
        - Apesar de estarmos instanciando um DPFirstExample, estamos atribuindo ele a uma variável do tipo da superclasse dela (no caso, DPExample). 
        Isso funciona perfeitamente (e é uma boa prática de programação). É o tal do polimorfismo! - http://pt.wikipedia.org/wiki/Polimorfismo
        - Novamente teremos um erro de compilação. Você já deve saber resolvê-lo :)
     
     6) Repita o item 5 para os outros exemplos.
     
     7) Note que na nossa classe AppDelegate, temos um #import desnecessário (pois estamos fazendo o #import mas não usamos a classe importada
     em nenhum lugar. Aqui isso não vai ser um problema, mas em programas maiores, isso pode causar lentidão (principalmente para compilar o programa)
     e fere os princípios do baixo acoplamento. Remova esse import.
     
     8) Voilá! Tudo deve estar funcionando, mais bonito e mais belo! É hora de adicionar os arquivos gerados e modificados no git, commitar com uma
     frase bem bonita e descritiva e pushar tudo isso para o repositório!
     
     */
    
    NSLog(@"YAY!");
    
    
}

@end
