import UIKit

// MARK: - Model
class TicTacToeModel {
    var board: [String] = Array(repeating: "", count: 9)
    var isPlayerTurn = true
    
    func checkWinner() -> String? {
        let winPatterns = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8],
            [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 6]
        ]
        for pattern in winPatterns {
            let (a, b, c) = (board[pattern[0]], board[pattern[1]], board[pattern[2]])
            if a == b, b == c, !a.isEmpty {
                return a
            }
        }
        return board.contains("") ? nil : "Draw"
    }
    
    func bestMove() -> Int? {
        var bestScore = Int.min
        var move: Int? = nil
        for i in 0..<9 where board[i].isEmpty {
            board[i] = "O"
            let score = minimax(isMaximizing: false)
            board[i] = ""
            if score > bestScore {
                bestScore = score
                move = i
            }
        }
        return move
    }
    
    private func minimax(isMaximizing: Bool) -> Int {
        if let winner = checkWinner() {
            if winner == "O" { return 1 }
            if winner == "X" { return -1 }
            return 0
        }
        let bestScore = isMaximizing ? Int.min : Int.max
        for i in 0..<9 where board[i].isEmpty {
            board[i] = isMaximizing ? "O" : "X"
            let score = minimax(isMaximizing: !isMaximizing)
            board[i] = ""
            return isMaximizing ? max(bestScore, score) : min(bestScore, score)
        }
        return bestScore
    }
}

// MARK: - View
class TicTacToeCell: UICollectionViewCell {
    let label: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.black.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Controller
class TicTacToeViewController: UIViewController {
    private var model = TicTacToeModel()
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TicTacToeCell.self, forCellWithReuseIdentifier: "Cell")
        
        view.addSubview(collectionView)
    }
    
    func aiMove() {
        DispatchQueue.global().async {
            if let bestMove = self.model.bestMove() {
                DispatchQueue.main.async {
                    self.model.board[bestMove] = "O"
                    self.collectionView.reloadItems(at: [IndexPath(item: bestMove, section: 0)])
                    if let winner = self.model.checkWinner() {
                        self.showAlert(winner: winner)
                    } else {
                        self.model.isPlayerTurn = true
                    }
                }
            }
        }
    }
    
    func showAlert(winner: String) {
        let alert = UIAlertController(title: "Game Over", message: winner == "Draw" ? "It's a draw!" : "\(winner) wins!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            self.model.board = Array(repeating: "", count: 9)
            self.collectionView.reloadData()
            self.model.isPlayerTurn = true
        })
        present(alert, animated: true)
    }
}

extension TicTacToeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TicTacToeCell
        cell.label.text = model.board[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard model.isPlayerTurn, model.board[indexPath.item].isEmpty else { return }
        model.board[indexPath.item] = "X"
        collectionView.reloadItems(at: [indexPath])
        if let winner = model.checkWinner() {
            showAlert(winner: winner)
        } else {
            model.isPlayerTurn = false
            aiMove()
        }
    }
}
