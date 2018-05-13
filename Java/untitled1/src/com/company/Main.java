package com.company;

import java.util.function.Consumer;
import java.util.function.Supplier;

public class Main {

    public static void main(String[] args) {
	// write your code here
        String s = new String("String");

        Supplier <String> supplier = ()->s;

        Cl1 <CharSequence> stringCl1 = Cl1.getCl1("ChS");

        System.out.print(stringCl1.get(supplier));
        new Main().foo();
    }

    public <T extends Document> Processor<T> getProcessor(T document){
        if(document instanceof DocumentSell){
            return (Processor<T>) new ProcessorSell();
        }else if(document instanceof DocumentPayback){
            return (Processor<T>) new ProcessorPayback();
        }else{
            return null;
        }
    }

    public void foo (){
        Document doc =  new DocumentPayback();
        boolean processor = getProcessor(doc).process(doc);
    }
}

class  Document{}

class DocumentSell extends Document{}
class DocumentPayback extends Document{}

interface  Processor<T extends Document> {
    boolean process(T document);
}

class ProcessorSell implements Processor<DocumentSell>{
    @Override
    public boolean process(DocumentSell document) {
        return false;
    }
}
class ProcessorPayback implements Processor<DocumentPayback>{
    @Override
    public boolean process(DocumentPayback document) {
        return true;
    }
}

final class Cl1<T> {

    private final T mValue;

    private Cl1 (T value){
        mValue = value;
    }

    public static <T> Cl1 <T> getCl1 (T value){
        return new Cl1<>(value);
    }

    public <K extends T> T get(Supplier<K> supplier){
        return mValue != null ? mValue : supplier.get();
    }

    public void set(Consumer<T> consumer){
        if (mValue!=null) consumer.accept(mValue);
    }
}
