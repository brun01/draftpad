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
    [album setTracks:@"X Y Z"];
    
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


@end
