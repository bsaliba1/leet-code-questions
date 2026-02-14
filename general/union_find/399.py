# 399. Evaluate Division
# Link: https://leetcode.com/problems/evaluate-division/

import collections


class Solution():
    def calcEquation(self, equations, values, queries):

        graph = {}

        def build_graph(equations, values):
            def add_edge(f, t, value):
                if f in graph:
                    graph[f].append((t, value))
                else:
                    graph[f] = [(t, value)]

            for vertices, value in zip(equations, values):
                f, t = vertices
                add_edge(f, t, value)
                add_edge(t, f, 1/value)

        def find_path(query):
            b, e = query

            if b not in graph or e not in graph:
                return -1.0

            q = collections.deque([(b, 1.0)])
            visited = set()

            while q:
                front, cur_product = q.popleft()
                if front == e:
                    return cur_product
                visited.add(front)
                for neighbor, value in graph[front]:
                    if neighbor not in visited:
                        q.append((neighbor, cur_product*value))
            return -1.0

        build_graph(equations, values)
        return [find_path(q) for q in queries]

    def rewrittenCalc(self, equations, values, queries):

        graph = {}

        def build_graph(equations, values):
            def append_to_graph(f, t, val):
                if f not in graph:
                    graph[f] = [(t, val)]
                else:
                    graph[f].append((t, val))

            for nodes, val in zip(equations, values):
                f, t = nodes
                append_to_graph(f, t, val)
                append_to_graph(t, f, 1/val)

        def find_path(query):
            f, t = query

            if f not in graph or t not in graph:
                return -1.0

            q = collections.deque([(f, 1.0)])
            visited = set()

            while q:
                n, tot_weight = q.popleft()
                if n == t:
                    return tot_weight
                visited.add(n)
                for neighbor, value in graph[n]:
                    if neighbor not in visited:
                        q.append((neighbor, tot_weight*value))
            return -1.0
        build_graph(equations, values)
        return [find_path(q) for q in queries]


print(Solution().calcEquation([["a","b"],["e","f"],["b","e"]],
                              [3.4,1.4,2.3],
                              [["b","a"],["a","f"],["f","f"],["e","e"],["c","c"],["a","c"],["f","e"]]))
print(Solution().rewrittenCalc([["a","b"],["e","f"],["b","e"]],
                              [3.4,1.4,2.3],
                              [["b","a"],["a","f"],["f","f"],["e","e"],["c","c"],["a","c"],["f","e"]]))

