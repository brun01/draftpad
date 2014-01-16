//
//  AppDelegate.m
//  Draftpad
//
//  Created by Bruno Fernandes on 13/01/14.
//  Copyright (c) 2014 Paper Street Apps. All rights reserved.
//

#import "AppDelegate.h"

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


@end
