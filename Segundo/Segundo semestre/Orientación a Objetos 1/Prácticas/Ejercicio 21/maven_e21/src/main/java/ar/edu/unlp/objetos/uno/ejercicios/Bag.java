package ar.edu.unlp.objetos.uno.ejercicios;

import java.util.AbstractCollection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class Bag<T> extends AbstractCollection<T> implements IBag<T> {

    Map<T, Integer> elements;

    public Bag() {
        // TODO Completar con la instanciación adecuada
        // this.elements = ....
    	this.elements = new HashMap<T, Integer>();
    }

    @Override
    public boolean add(T element) {
        // TODO Completar con la implementación correspondiente
    	if(this.elements.containsKey(element)) {
    		this.elements.put(element, this.elements.get(element)+1);
    	}
    	else {
    		this.elements.put(element, 1);
    	}
        return true;
    }

    @Override
    public int occurrencesOf(T element) {
        // TODO Completar con la implementación correspondiente
    	if(this.elements.containsKey(element)) {
    		return this.elements.get(element);
    	}
        return 0;
    }

    @Override
    public void removeOccurrence(T element) {
        // TODO Completar con la implementación correspondiente
    	if(this.elements.containsKey(element)) {
    		if(this.elements.get(element) == 1) {
    			this.elements.remove(element);
    		}
    		else {
    			this.elements.put(element, this.elements.get(element)-1);
    		}
    	}
    }

    @Override
    public void removeAll(T element) {
        // TODO Completar con la implementación correspondiente
    	this.elements.remove(element);
    }

    @Override
    public int size() {
        // TODO Completar con la implementación correspondiente
    	
    	return this.elements.entrySet().stream().mapToInt(e -> this.occurrencesOf(e.getKey())).sum();
    	//return this.elements.keySet().stream().mapToInt(e -> this.occurrencesOf(e)).sum();
    	
    }

    @Override
    public Iterator<T> iterator() {
        return new Iterator<T>() {
            private Iterator<Map.Entry<T, Integer>> entryIterator = elements.entrySet().iterator();
            private Map.Entry<T, Integer> currentEntry;
            private int remainingCount;

            @Override
            public boolean hasNext() {
                return remainingCount > 0 || entryIterator.hasNext();
            }

            @Override
            public T next() {
                if (remainingCount == 0) {
                    currentEntry = entryIterator.next();
                    remainingCount = currentEntry.getValue();
                }
                remainingCount--;
                return currentEntry.getKey();
            }

            @Override
            public void remove() {
                removeOccurrence(currentEntry.getKey());
            }
        };
    }
}
